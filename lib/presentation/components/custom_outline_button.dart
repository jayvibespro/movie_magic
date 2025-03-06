import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final Color color;
  final double borderWidth;
  final EdgeInsetsGeometry? padding;

  const CustomOutlineButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color = Colors.white,
    this.borderWidth = 0.2,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: color,
            width: borderWidth,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          padding: padding ??
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
