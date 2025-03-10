import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_magic/core/utils/constants/colors.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
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
    return MaterialButton(
      disabledColor: cBlackWithOpacity,
      disabledElevation: 0,
      elevation: elevation ?? 5,
      minWidth: width ?? MediaQuery.of(context).size.width,
      height: height ?? 50,
      padding: EdgeInsets.all(padding),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      color: backgroundColor,
      onPressed: disabled == false ? onPressed : null,
      child:
          child ??
          Text(
            label ?? "Continue".tr,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
    );
  }
}
