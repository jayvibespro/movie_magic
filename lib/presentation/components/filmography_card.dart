import 'package:daladala/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class FilmographyCard extends StatelessWidget {
  const FilmographyCard({super.key});

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
            Image.asset(
              "assets/images/doctor_strange.jpg",
              height: 180,
              width: 280,
              fit: BoxFit.cover,
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
                        "Fast & Furious 7",
                        style: TextStyle(color: cWhite, fontSize: 17),
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
