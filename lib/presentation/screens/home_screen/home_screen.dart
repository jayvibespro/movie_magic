import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:movie_magic/core/utils/constants/colors.dart';
import 'package:movie_magic/presentation/components/actor_card.dart';
import 'package:movie_magic/presentation/components/custom_loader.dart';
import 'package:movie_magic/presentation/components/custom_page_view.dart';
import 'package:movie_magic/presentation/components/section_title.dart';

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

  @override
  void initState() {
    _homeScreenController.initialize(setState, context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
