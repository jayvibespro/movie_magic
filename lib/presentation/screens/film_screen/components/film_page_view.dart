import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../components/custom_divider.dart';
import '../../../components/double_material_button.dart';

class FilmPageView extends StatefulWidget {
  final List<int> pages;
  const FilmPageView({super.key, required this.pages});

  @override
  State<FilmPageView> createState() => _FilmPageViewState();
}

class _FilmPageViewState extends State<FilmPageView> {
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
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset("assets/svg/star.svg", width: 20),
                          Text(
                            " 7.5",
                            style: TextStyle(color: cGrey, fontSize: 16),
                          ),
                        ],
                      ),
                      CustomDivider(height: 20),
                      Text(
                        "2023",
                        style: TextStyle(color: cGrey, fontSize: 16),
                      ),
                      CustomDivider(),
                      Text("12+", style: TextStyle(color: cGrey, fontSize: 16)),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: DoubleMaterialButton(
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
