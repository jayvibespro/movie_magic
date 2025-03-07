import '../../core/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  final Color? color;
  final double size;
  final double horizontalPadding;
  final double verticalPadding;
  const Dot({
    super.key,
    this.color = cWhiteWithOpacity,
    this.size = 3,
    this.horizontalPadding = 5,
    this.verticalPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
