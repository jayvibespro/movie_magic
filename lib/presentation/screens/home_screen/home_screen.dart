import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:googleapis_auth/googleapis_auth.dart' as auth;
import 'package:http/http.dart' as http;
import 'package:movie_magic/core/utils/constants/colors.dart';
import 'package:movie_magic/presentation/components/actor_card.dart';
import 'package:movie_magic/presentation/components/custom_loader.dart';
import 'package:movie_magic/presentation/components/custom_page_view.dart';
import 'package:movie_magic/presentation/components/section_title.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../core/di/di.dart';
import '../../components/playing_movie_card.dart';
import '../../components/trending_movie_card.dart';
import '../actor_screen/actor_screen.dart';
import '../film_screen/film_screen.dart';
import 'home_screen_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeScreenController _homeScreenController =
      getIt<HomeScreenController>();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  String? _token;

  @override
  void initState() {
    _homeScreenController.initialize(setState, context);
    sendPushMessage();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> requestPermissions() async {
    // Request for the required permissions
    Map<Permission, PermissionStatus> statuses =
        await [
          Permission.notification,
          Permission.accessNotificationPolicy,
          Permission.sensorsAlways,
        ].request();

    // Checking the status of each permission
    if (statuses[Permission.notification]!.isGranted) {
      if (kDebugMode) {
        print("Notification permission granted");
      }
    } else {
      if (kDebugMode) {
        print("Notification permission denied");
      }
    }

    // For Android 13 and above, ensure POST_NOTIFICATIONS permission is granted
    if (statuses[Permission.notification]!.isGranted) {
      // If notification permission is granted, you can proceed
      if (kDebugMode) {
        print('Notification Permission Granted');
      }
    } else {
      // Handle the case when permission is denied
      if (kDebugMode) {
        print('Notification Permission Denied');
      }
    }
  }

  Future<void> sendPushMessage() async {
    await requestPermissions();

    final String? accessToken = await getFirebaseAccessToken();
    if (accessToken == null) return;

    _token = await _firebaseMessaging.getToken();
    if (_token == null) {
      if (kDebugMode) {
        print('Unable to send FCM message, no token exists.');
      }
      return;
    }

    if (kDebugMode) {
      print("FCM TOKEN: $_token");
    }

    try {
      final Map<String, dynamic> body = {
        "message": {
          "token": _token,
          "notification": {
            "title": "Welcome to Movie Magic!",
            "body":
                "This application says hello to you! and we hope you enjoy it.",
          },
        },
      };

      final response = await http.post(
        Uri.parse(
          'https://fcm.googleapis.com/v1/projects/movie-magic-f8139/messages:send',
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Authorization": "Bearer $accessToken",
        },
        body: jsonEncode(body),
      );
      if (kDebugMode) {
        print('FCM message request for device sent!');
        print('FCM_RESPONSE: ${response.body}');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<String?> getFirebaseAccessToken() async {
    try {
      // Load service account credentials from assets
      final String jsonString = await rootBundle.loadString(
        'assets/movie-magic.json',
      );
      final Map<String, dynamic> jsonMap = json.decode(jsonString);

      // Create credentials from JSON
      final credentials = auth.ServiceAccountCredentials.fromJson(jsonMap);

      // Define required scopes
      final List<String> scopes = [
        'https://www.googleapis.com/auth/cloud-platform',
      ];

      // Get authenticated client
      final auth.AuthClient client = await clientViaServiceAccount(
        credentials,
        scopes,
      );

      // Get the access token
      final accessToken = client.credentials.accessToken;

      if (kDebugMode) {
        print("Bearer Token: ${accessToken.data}");
      }
      return accessToken.data;
    } catch (e) {
      if (kDebugMode) {
        print("Error getting token: $e");
      }
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: cBlack,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: cBlack,
        body: RefreshIndicator(
          color: cPrimary,
          backgroundColor: cWhite,
          onRefresh: () {
            return _homeScreenController.loadInitialData();
          },
          child:
              _homeScreenController.state.loading
                  ? CustomLoader()
                  : ListView(
                    padding: EdgeInsets.all(0),
                    children: [
                      CustomPageView(
                        movies: _homeScreenController.state.discoverMovies,
                      ),
                      SectionTitle(title: "Continue Watching"),
                      SingleChildScrollView(
                        padding: EdgeInsets.only(left: 20, right: 10),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            PlayingMovieCard(),
                            PlayingMovieCard(),
                            PlayingMovieCard(),
                          ],
                        ),
                      ),
                      SectionTitle(title: "Trending Now"),
                      SingleChildScrollView(
                        padding: EdgeInsets.only(left: 20, right: 10),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children:
                              _homeScreenController.state.trendingMovies
                                  .map(
                                    (movie) => TrendingMovieCard(
                                      movie: movie,
                                      onTap: () {
                                        _homeScreenController
                                            .appState
                                            .selectedMovie = movie;
                                        Get.to(
                                          () => const FilmScreen(),
                                          transition: Transition.rightToLeft,
                                          curve: Curves.easeInOutBack,
                                          duration: const Duration(
                                            milliseconds: 1200,
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                  .toList(),
                        ),
                      ),
                      SectionTitle(title: "Latest Movies"),
                      SingleChildScrollView(
                        padding: EdgeInsets.only(left: 20, right: 10),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children:
                              _homeScreenController.state.latestMovies
                                  .map(
                                    (movie) => TrendingMovieCard(
                                      movie: movie,
                                      onTap: () {
                                        _homeScreenController
                                            .appState
                                            .selectedMovie = movie;
                                        Get.to(
                                          () => const FilmScreen(),
                                          transition: Transition.rightToLeft,
                                          curve: Curves.easeInOutBack,
                                          duration: const Duration(
                                            milliseconds: 1200,
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                  .toList(),
                        ),
                      ),
                      SectionTitle(title: "Actors"),
                      SingleChildScrollView(
                        padding: EdgeInsets.only(left: 20),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                              _homeScreenController.state.popularPeople
                                  .map(
                                    (actor) => ActorCard(
                                      actor: actor,
                                      onTap: () {
                                        _homeScreenController
                                            .appState
                                            .selectedPeople = actor;
                                        Get.to(
                                          () => const ActorScreen(),
                                          transition: Transition.rightToLeft,
                                          curve: Curves.easeInOutBack,
                                          duration: const Duration(
                                            milliseconds: 1200,
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                  .toList(),
                        ),
                      ),
                      SizedBox(height: 60),
                    ],
                  ),
        ),
      ),
    );
  }
}
