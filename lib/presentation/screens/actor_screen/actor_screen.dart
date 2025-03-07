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
                    ActorPageView(pages: [1, 2, 3, 4, 5, 6]),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 10, 20, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Actor', style: TextStyle(color: cGrey)),
                              Dot(),
                              Text('Producer', style: TextStyle(color: cGrey)),
                              Dot(),
                              Text('Stunts', style: TextStyle(color: cGrey)),
                            ],
                          ),
                          Text('July 26, 1967', style: TextStyle(color: cGrey)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jason Statham",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            """Jason Statham (/ˈsteɪθəm/ STAY-thəm; born 26 July 1967) is an English actor and producer. He is known for portraying tough, gritty, or violent characters in various action thriller films, and has been credited for leading the resurgence of action films during the 2000s and 2010s.[1] By 2017, his films had grossed over £1.1 billion (\$1.5 billion), making him one of the industry's most bankable stars.""",
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
                        children: [
                          FilmographyCard(),
                          FilmographyCard(),
                          FilmographyCard(),
                          FilmographyCard(),
                        ],
                      ),
                    ),
                    SectionTitle(title: "Quick Facts", showTrailing: false),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Birth City: ",
                            style: TextStyle(
                              fontSize: 16,
                              color: cWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "Shirebrook",
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
                            "Birth Country: ",
                            style: TextStyle(
                              fontSize: 16,
                              color: cWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "England",
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
