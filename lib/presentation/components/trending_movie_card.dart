import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:movie_magic/core/models/movie_model/movie_model.dart';
import 'package:movie_magic/core/utils/constants/colors.dart';
import 'package:movie_magic/core/utils/constants/urls.dart';

import 'Custom_cached_image.dart';

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
              CustomCachedImage(
                imageUrl: "$backdropBaseUrl/${movie.posterPath ?? ""}",
                height: 220,
                width: 140,
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
                      style: TextStyle(color: cWhiteWithOpacity, fontSize: 14),
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
