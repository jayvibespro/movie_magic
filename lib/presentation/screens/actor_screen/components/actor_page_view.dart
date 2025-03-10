import 'package:flutter/material.dart';
import 'package:movie_magic/core/models/profile_model/profile_model.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/urls.dart';
import '../../../components/Custom_cached_image.dart';

class ActorPageView extends StatefulWidget {
  final List<ProfileModel> pages;

  const ActorPageView({super.key, required this.pages});

  @override
  State<ActorPageView> createState() => _ActorPageViewState();
}

class _ActorPageViewState extends State<ActorPageView> {
  final _pageViewController = PageController(initialPage: 0);

  int currentPage = 0;

  List<int> list = [];

  @override
  void initState() {
    getPages();
    super.initState();
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  void getPages() {
    if (widget.pages.length == list.length) return;
    for (int i = 0; i < widget.pages.length; i++) {
      list.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    getPages();
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      height: 360,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            scrollDirection: Axis.horizontal,
            controller: _pageViewController,
            children:
                widget.pages
                    .map(
                      (item) => Stack(
                        children: [
                          CustomCachedImage(
                            imageUrl: "$imageBaseUrl/${item.filePath ?? ""}",
                            width: MediaQuery.of(context).size.width,
                            height: 360,
                          ),
                        ],
                      ),
                    )
                    .toList(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 10),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    color: cBlack.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Top 58",
                        style: TextStyle(
                          color: cWhiteWithOpacity,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        " IMDb",
                        style: TextStyle(color: cGrey, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:
                  list.map((e) {
                    return AnimatedContainer(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      width: e == currentPage ? 12 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: e != currentPage ? cGrey : cWhite,
                      ),
                      duration: const Duration(milliseconds: 200),
                    );
                  }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
