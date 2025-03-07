import 'package:daladala/core/utils/constants/colors.dart';
import 'package:daladala/presentation/components/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';

class LikeDislikeButton extends StatelessWidget {
  const LikeDislikeButton({
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
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: cGrey.withOpacity(0.2),
      ),
      child: Row(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeroIcon(HeroIcons.handThumbUp, color: cWhite, size: 25),
              Text(" 254", style: TextStyle(color: cGrey, fontSize: 16)),
            ],
          ),
          CustomDivider(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeroIcon(HeroIcons.handThumbDown, color: cWhite, size: 25),
              Text(" 103", style: TextStyle(color: cGrey, fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }
}
