import 'package:daladala/core/utils/constants/colors.dart';
import 'package:daladala/presentation/components/actor_card.dart';
import 'package:daladala/presentation/components/custom_loader.dart';
import 'package:daladala/presentation/components/dot.dart';
import 'package:daladala/presentation/components/section_title.dart';
import 'package:heroicons/heroicons.dart';
import '../../components/custom_back_button.dart';
import '../../components/custom_icon_button.dart';
import '../../components/filmography_card.dart';
import '../../components/like_dislike_button.dart';
import '../../components/review_container.dart';
import 'components/actor_page_view.dart';
import 'actor_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../core/di/di.dart';

class ActorScreen extends StatefulWidget {
  const ActorScreen({super.key});

  @override
  State<ActorScreen> createState() => _ActorScreenState();
}

class _ActorScreenState extends State<ActorScreen> {
  final ActorScreenController _actorScreenController =
      getIt<ActorScreenController>();

  @override
  void initState() {
    _actorScreenController.initialize(setState, context);
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
            _actorScreenController.state.loading
                ? CustomLoader()
                : ListView(
                  padding: EdgeInsets.all(0),
                  children: [
                    ActorPageView(pages: _actorScreenController.state.profiles),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 10, 20, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                _actorScreenController
                                        .state
                                        .actor
                                        .knownForDepartment ??
                                    "Acting",
                                style: TextStyle(color: cGrey),
                              ),
                              /* Dot(),
                              Text('Producer', style: TextStyle(color: cGrey)),
                              Dot(),
                              Text('Stunts', style: TextStyle(color: cGrey)),*/
                            ],
                          ),
                          Text(
                            _actorScreenController.state.actor.birthday ??
                                'July 26, 1967',
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
                            _actorScreenController.state.actor.name ??
                                "Actor's Name",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            _actorScreenController.state.actor.biography ??
                                "Biography",
                            style: TextStyle(color: cWhiteWithOpacity),
                          ),
                        ],
                      ),
                    ),
                    SectionTitle(title: "Filmography"),
                    SingleChildScrollView(
                      padding: EdgeInsets.only(left: 20, bottom: 20),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:
                            _actorScreenController.state.knownFor
                                .map((movie) => FilmographyCard(movie: movie))
                                .toList(),
                      ),
                    ),
                    SectionTitle(title: "Quick Facts", showTrailing: false),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Also known as: ",
                            style: TextStyle(
                              fontSize: 16,
                              color: cWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              (_actorScreenController.state.actor.alsoKnownAs ??
                                      [])
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
                            "Place of Birth: ",
                            style: TextStyle(
                              fontSize: 16,
                              color: cWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              _actorScreenController.state.actor.placeOfBirth ??
                                  "England",
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
                            "Gender: ",
                            style: TextStyle(
                              fontSize: 16,
                              color: cWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              (_actorScreenController.state.actor.gender ??
                                          0) !=
                                      1
                                  ? "Male"
                                  : "Female",
                              style: TextStyle(fontSize: 16, color: cGrey),
                            ),
                          ),
                        ],
                      ),
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
