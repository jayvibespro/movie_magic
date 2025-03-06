import 'package:daladala/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double height;
  final double width;
  final double horizontalPadding;
  final double verticalPadding;

  const CustomDivider({
    super.key,
    this.height = 10,
    this.width = 1,
    this.horizontalPadding = 10,
    this.verticalPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Container(height: height, width: width, color: cGrey),
    );
  }
}
