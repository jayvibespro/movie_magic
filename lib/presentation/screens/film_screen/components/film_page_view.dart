import 'package:cached_network_image/cached_network_image.dart';
import 'package:daladala/core/models/movie_details_model/movie_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/urls.dart';
import '../../../components/Custom_cached_image.dart';
import '../../../components/custom_divider.dart';
import '../../../components/double_material_button.dart';

class FilmPageView extends StatefulWidget {
  final MovieDetailsModel movie;
  const FilmPageView({super.key, required this.movie});

  @override
  State<FilmPageView> createState() => _FilmPageViewState();
}

class _FilmPageViewState extends State<FilmPageView> {
  final _pageViewController = PageController(initialPage: 0);

  int currentPage = 0;

  List<int> list = [];
  List<String> pages = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  void getPages() {
    if (widget.movie.backdropPath != null && list.isEmpty) {
      list.add(0);
      pages.add(widget.movie.backdropPath!);
    }
    if (widget.movie.posterPath != null && list.length == 1) {
      list.add(1);
      pages.add(widget.movie.posterPath!);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    getPages();
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
                pages
                    .map(
                      (item) => Stack(
                        children: [
                          CustomCachedImage(
                            imageUrl: "$imageBaseUrl/$item}",
                            height: 360,
                            width: MediaQuery.of(context).size.width,
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
                            " ${(widget.movie.voteAverage ?? 0).toStringAsFixed(1)}",
                            style: TextStyle(color: cGrey, fontSize: 16),
                          ),
                        ],
                      ),
                      CustomDivider(height: 20),
                      Text(
                        "${widget.movie.releaseDate?.split("-").first}",
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
