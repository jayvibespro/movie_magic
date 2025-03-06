import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heroicons/heroicons.dart';

import '../../core/utils/constants/colors.dart';
import 'custom_divider.dart';
import 'custom_material_button.dart';

class CustomPageView extends StatefulWidget {
  final List<int> pages;
  const CustomPageView({super.key, required this.pages});

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
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
    for (int i = 0; i < widget.pages.length; i++) {
      list.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                          Image.asset(
                            "assets/images/doctor_strange.jpg",
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  20.0,
                                  0,
                                  20,
                                  5,
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 15,
                                  ),
                                  decoration: BoxDecoration(
                                    color: cBlack.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset("assets/svg/star.svg"),
                                      Text(
                                        " 7.5",
                                        style: TextStyle(
                                          color: cGrey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  20.0,
                                  0,
                                  20,
                                  5,
                                ),
                                child: Text(
                                  "Doctor Strange",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  20.0,
                                  0,
                                  20,
                                  10,
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 15,
                                  ),
                                  decoration: BoxDecoration(
                                    color: cBlack.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Action",
                                        style: TextStyle(
                                          color: cGrey,
                                          fontSize: 14,
                                        ),
                                      ),
                                      CustomDivider(),
                                      Text(
                                        "Adventure",
                                        style: TextStyle(
                                          color: cGrey,
                                          fontSize: 14,
                                        ),
                                      ),
                                      CustomDivider(),
                                      Text(
                                        "Fantasy",
                                        style: TextStyle(
                                          color: cGrey,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  20,
                                  0,
                                  20,
                                  20,
                                ),
                                child: CustomMaterialButton(
                                  onPressed: () {},
                                  child: HeroIcon(
                                    HeroIcons.play,
                                    color: cWhite,
                                    style: HeroIconStyle.solid,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                    .toList(),
          ),

          Positioned(
            right: 20,
            bottom: 90,
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
