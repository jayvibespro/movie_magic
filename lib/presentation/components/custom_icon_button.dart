import 'package:flutter/material.dart';

import '../../core/utils/constants/colors.dart';

class CustomIconButton extends StatelessWidget {
  final Color? color;
  final Widget icon;
  const CustomIconButton({super.key, this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: color ?? cGrey.withOpacity(0.2),
      ),
      child: icon,
    );
  }
}
