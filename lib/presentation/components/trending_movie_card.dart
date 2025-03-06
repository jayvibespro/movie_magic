import 'package:daladala/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class TrendingMovieCard extends StatelessWidget {
  const TrendingMovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        height: 220,
        width: 140,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Image.asset(
              "assets/images/doctor_strange.jpg",
              height: 220,
              width: 140,
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
                    "Heart of Stone",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: cGrey, fontSize: 14),
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
