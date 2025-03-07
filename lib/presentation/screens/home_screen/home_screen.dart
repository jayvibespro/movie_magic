import 'package:daladala/core/utils/constants/colors.dart';
import 'package:daladala/presentation/components/actor_card.dart';
import 'package:daladala/presentation/components/custom_material_button.dart';
import 'package:daladala/presentation/components/custom_page_view.dart';
import 'package:daladala/presentation/components/section_title.dart';
import 'package:daladala/presentation/components/trending_movie_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heroicons/heroicons.dart';

import '../../components/custom_divider.dart';
import '../../components/playing_movie_card.dart';
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
        body: ListView(
          padding: EdgeInsets.all(0),
          children: [
            CustomPageView(pages: [1, 2, 3, 4, 5, 6]),
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
                children: [
                  TrendingMovieCard(),
                  TrendingMovieCard(),
                  TrendingMovieCard(),
                ],
              ),
            ),
            SectionTitle(title: "Latest Movies"),
            SingleChildScrollView(
              padding: EdgeInsets.only(left: 20, right: 10),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  TrendingMovieCard(),
                  TrendingMovieCard(),
                  TrendingMovieCard(),
                ],
              ),
            ),
            SectionTitle(title: "Actors"),
            SingleChildScrollView(
              padding: EdgeInsets.only(left: 20),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ActorCard(),
                  ActorCard(),
                  ActorCard(),
                  ActorCard(),
                  ActorCard(),
                ],
              ),
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
