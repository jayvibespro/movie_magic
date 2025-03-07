import 'package:daladala/core/utils/constants/colors.dart';
import 'package:daladala/presentation/components/actor_card.dart';
import 'package:daladala/presentation/components/dot.dart';
import 'package:daladala/presentation/components/section_title.dart';
import 'package:heroicons/heroicons.dart';
import '../../components/custom_back_button.dart';
import '../../components/custom_icon_button.dart';
import '../../components/like_dislike_button.dart';
import '../../components/review_container.dart';
import 'components/film_page_view.dart';
import 'film_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../core/di/di.dart';

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
            ListView(
              padding: EdgeInsets.all(0),
              children: [
                FilmPageView(pages: [1, 2, 3, 4, 5, 6]),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10, 20, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Action', style: TextStyle(color: cGrey)),
                          Dot(),
                          Text('Adventure', style: TextStyle(color: cGrey)),
                          Dot(),
                          Text('Fantasy', style: TextStyle(color: cGrey)),
                        ],
                      ),
                      Text('3h 12m', style: TextStyle(color: cGrey)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Doctor Strange",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        """Dr. Stephen Vincent Strange is a fictional character appearing in American comic books published by Marvel Comics. Created by Steve Ditko, the character first appeared in Strange Tales #110 (cover-dated July 1963). Doctor Strange serves as the Sorcerer Supreme, the primary protector of Earth against magical and mystical threats. Strange was introduced during the Silver Age of Comic Books in an attempt to bring a different kind of character and themes of mysticism to Marvel Comics.""",
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
                SectionTitle(title: "Cast & Crew"),
                SingleChildScrollView(
                  padding: EdgeInsets.only(left: 20, bottom: 20),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      /*ActorCard(isActor: false),
                      ActorCard(isActor: false),
                      ActorCard(isActor: false),
                      ActorCard(isActor: false),
                      ActorCard(isActor: false),*/
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                          "English, Polish, Germany, Spanish",
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
                          "English, Germany, Spanish",
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
            ),
            Positioned(top: 50, left: 20, child: CustomBackButton()),
          ],
        ),
      ),
    );
  }
}
