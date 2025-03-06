import 'package:daladala/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class PlayingMovieCard extends StatelessWidget {
  const PlayingMovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        height: 140,
        width: 260,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Image.asset(
              "assets/images/doctor_strange.jpg",
              height: 140,
              width: 260,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 5,
              right: 5,
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: cBlack.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: HeroIcon(HeroIcons.xMark, color: cWhite, size: 20),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(color: cBlack.withOpacity(0.7)),
                child: Column(
                  children: [
                    LinearProgressIndicator(
                      value: 0.65,
                      color: cPrimary,
                      minHeight: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HeroIcon(
                            HeroIcons.play,
                            color: cWhite,
                            style: HeroIconStyle.solid,
                            size: 20,
                          ),
                          Text(
                            "1:26:53",
                            style: TextStyle(color: cGrey, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
