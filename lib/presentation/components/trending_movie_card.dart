import 'package:cached_network_image/cached_network_image.dart';
import 'package:daladala/core/models/movie_model/movie_model.dart';
import 'package:daladala/core/utils/constants/colors.dart';
import 'package:daladala/core/utils/constants/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shimmer/shimmer.dart';

import '../screens/film_screen/film_screen.dart';

class TrendingMovieCard extends StatelessWidget {
  final MovieModel movie;
  final VoidCallback onTap;
  const TrendingMovieCard({
    super.key,
    required this.movie,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 220,
          width: 140,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: "$backdropBaseUrl/${movie.posterPath ?? ""}",
                height: 220,
                width: 140,
                placeholder:
                    (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 220,
                        width: 140,
                        color: Colors.white,
                      ),
                    ),
                errorWidget:
                    (context, url, error) => Container(
                      color: Colors.grey.shade300,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HeroIcon(
                            HeroIcons.informationCircle,
                            color: Colors.black,
                            size: 60,
                          ),
                          Text(
                            "Unable to load image",
                            style: TextStyle(color: cGrey, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 5,
                right: 5,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: cBlack.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: HeroIcon(
                    HeroIcons.bookmark,
                    style: HeroIconStyle.solid,
                    color: cWhite,
                    size: 16,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(color: cBlack.withOpacity(0.7)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      movie.title ?? "Movie Title",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: cGrey, fontSize: 14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
