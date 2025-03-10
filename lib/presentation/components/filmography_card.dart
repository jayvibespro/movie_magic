import 'package:daladala/core/models/movie_model/movie_model.dart';
import 'package:daladala/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

import '../../core/utils/constants/urls.dart';
import 'Custom_cached_image.dart';

class FilmographyCard extends StatelessWidget {
  final MovieModel movie;
  const FilmographyCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        height: 180,
        width: 280,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            CustomCachedImage(
              imageUrl: "$imageBaseUrl/${movie.backdropPath ?? ""}",
              height: 180,
              width: 280,
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(color: cBlack.withOpacity(0.7)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Role: Deckard Shaw",
                        style: TextStyle(color: cGrey, fontSize: 14),
                      ),
                      Text(
                        movie.originalTitle ?? "Movie Name",
                        style: TextStyle(
                          color: cWhiteWithOpacity,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
