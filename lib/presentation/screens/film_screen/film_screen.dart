import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heroicons/heroicons.dart';
import 'package:movie_magic/core/utils/constants/colors.dart';
import 'package:movie_magic/core/utils/string_utils.dart';
import 'package:movie_magic/presentation/components/custom_material_button.dart';
import 'package:movie_magic/presentation/components/dot.dart';
import 'package:movie_magic/presentation/components/section_title.dart';

import '../../../../../core/di/di.dart';
import '../../components/custom_back_button.dart';
import '../../components/custom_icon_button.dart';
import '../../components/custom_loader.dart';
import '../../components/like_dislike_button.dart';
import '../../components/review_container.dart';
import 'components/film_page_view.dart';
import 'film_screen_controller.dart';

class FilmScreen extends StatefulWidget {
  const FilmScreen({super.key});

  @override
  State<FilmScreen> createState() => _FilmScreenState();
}

class _FilmScreenState extends State<FilmScreen> {
  final FilmScreenController _filmScreenController =
      getIt<FilmScreenController>();

  @override
  void initState() {
    _filmScreenController.initialize(setState, context);
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
        body: Stack(
          children: [
            _filmScreenController.state.loading
                ? CustomLoader()
                : _filmScreenController.state.message == null
                ? ListView(
                  padding: EdgeInsets.all(0),
                  children: [
                    FilmPageView(movie: _filmScreenController.state.movie),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 10, 20, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                  (_filmScreenController.state.movie.genres ??
                                          [])
                                      .length,
                                  (index) => Row(
                                    children: [
                                      Text(
                                        _filmScreenController
                                                .state
                                                .movie
                                                .genres![index]
                                                .name ??
                                            "Genre",
                                        style: TextStyle(color: cGrey),
                                      ),
                                      if (index !=
                                          _filmScreenController
                                                  .state
                                                  .movie
                                                  .genres!
                                                  .length -
                                              1)
                                        Dot(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            StringUtils.formatDuration(
                              _filmScreenController.state.movie.runtime ?? 94,
                            ),
                            style: TextStyle(color: cGrey),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _filmScreenController.state.movie.title ??
                                "Movie Title",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            _filmScreenController.state.movie.overview ??
                                "Movie Overview",
                            style: TextStyle(color: cWhiteWithOpacity),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LikeDislikeButton(onPressed: () {}),
                              Row(
                                children: [
                                  CustomIconButton(
                                    icon: HeroIcon(
                                      HeroIcons.bookmark,
                                      style: HeroIconStyle.solid,
                                      color: cWhite,
                                      size: 16,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  CustomIconButton(
                                    color: cPrimary,
                                    icon: HeroIcon(
                                      HeroIcons.arrowDownTray,
                                      style: HeroIconStyle.solid,
                                      color: cWhite,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    /*SectionTitle(title: "Cast & Crew"),
                SingleChildScrollView(
                  padding: EdgeInsets.only(left: 20, bottom: 20),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ActorCard(isActor: false),
                      ActorCard(isActor: false),
                      ActorCard(isActor: false),
                      ActorCard(isActor: false),
                      ActorCard(isActor: false),
                    ],
                  ),
                ),*/
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Audio Track: ",
                            style: TextStyle(
                              fontSize: 16,
                              color: cWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              (_filmScreenController
                                          .state
                                          .movie
                                          .spokenLanguages ??
                                      [])
                                  .map(
                                    (language) =>
                                        "${language.name} (${language.iso6391 ?? 'en'})" ??
                                        "English",
                                  )
                                  .join(", "),
                              style: TextStyle(fontSize: 16, color: cGrey),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Subtitles: ",
                            style: TextStyle(
                              fontSize: 16,
                              color: cWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              (_filmScreenController
                                          .state
                                          .movie
                                          .spokenLanguages ??
                                      [])
                                  .map(
                                    (language) =>
                                        "${language.name} (${language.iso6391 ?? 'en'})" ??
                                        "English",
                                  )
                                  .join(", "),
                              style: TextStyle(fontSize: 16, color: cGrey),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SectionTitle(
                      title: "Reviews",
                      trailing: TextButton(
                        onPressed: () {},
                        child: Text("All Reviews"),
                      ),
                    ),
                    ReviewContainer(
                      review:
                          "Visually stunning action and packed but story is light",
                    ),
                    ReviewContainer(
                      review:
                          "Possibly the longest movie i've ever watch in theater yet one of the most fascinating movies",
                    ),
                    SizedBox(height: 60),
                  ],
                )
                : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HeroIcon(
                        HeroIcons.informationCircle,
                        color: cWhiteWithOpacity,
                        size: 45,
                      ),
                      Text(
                        _filmScreenController.state.message!,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      CustomMaterialButton(
                        onPressed: () => _filmScreenController.getMovie(),
                        label: "Retry",
                      ),
                    ],
                  ),
                ),
            Positioned(top: 50, left: 20, child: CustomBackButton()),
          ],
        ),
      ),
    );
  }
}
