import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

import '../../core/utils/constants/colors.dart';

class DoubleMaterialButton extends StatelessWidget {
  const DoubleMaterialButton({
    super.key,
    this.label,
    required this.onPressed,
    this.child,
    this.backgroundColor = cPrimary,
    this.textColor = cWhite,
    this.radius = 30,
    this.padding = 12,
    this.elevation,
    this.width,
    this.height,
    this.disabled = false,
  });

  final Function() onPressed;
  final Widget? child;
  final Color backgroundColor;
  final Color textColor;
  final String? label;
  final double radius;
  final double padding;
  final double? elevation;
  final double? width;
  final double? height;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              color: cPrimary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HeroIcon(
                    HeroIcons.play,
                    color: cWhite,
                    style: HeroIconStyle.solid,
                    size: 16,
                  ),
                  Text(" Watch Now"),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              color: cWhite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HeroIcon(
                    HeroIcons.film,
                    color: cPrimary,
                    style: HeroIconStyle.solid,
                    size: 16,
                  ),
                  Text(" Watch Trailer", style: TextStyle(color: cPrimary)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
