import 'package:daladala/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController customSnackBar(String message) {
  return Get.snackbar(
    "Message",
    message,
    snackPosition: SnackPosition.BOTTOM,
    colorText: cWhite,
    duration: const Duration(seconds: 4),
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.all(20),
  );
}
