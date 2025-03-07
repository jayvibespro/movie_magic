import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';

import '../../core/utils/constants/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.back(),
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: cWhite,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            width: 0.5,
            color: cWhiteWithOpacity.withOpacity(0.5),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(1, 4),
            ),
          ],
        ),
        child: HeroIcon(HeroIcons.chevronLeft, color: cBlack, size: 20),
      ),
    );
  }
}
