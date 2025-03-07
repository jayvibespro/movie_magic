import 'package:daladala/core/utils/constants/colors.dart';
import 'package:daladala/presentation/components/actor_card.dart';
import 'package:daladala/presentation/components/custom_loader.dart';
import 'package:daladala/presentation/components/custom_material_button.dart';
import 'package:daladala/presentation/components/custom_page_view.dart';
import 'package:daladala/presentation/components/section_title.dart';
import 'package:daladala/presentation/components/trending_movie_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heroicons/heroicons.dart';

import '../../components/custom_divider.dart';
import '../../components/playing_movie_card.dart';
import '../film_screen/film_screen.dart';
import 'home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import '../../../../../core/di/di.dart';

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
                          children:
                              _homeScreenController.state.popularPeople
                                  .map((actor) => ActorCard(actor: actor))
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
