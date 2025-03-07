import 'package:flutter/material.dart';

import '../../core/utils/constants/colors.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: cPrimary,
        strokeCap: StrokeCap.round,
        strokeWidth: 8,
      ),
    );
  }
}
