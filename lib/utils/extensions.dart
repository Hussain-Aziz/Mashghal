import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mushaghal/utils/colors.dart';

extension ClampWithWarning on int {
  int clampWithWarning(int minValue, int maxValue) {
    if (this < minValue) {
      Get.snackbar("Item Count", "You can't reduce more",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return minValue;
    } else if (this > maxValue) {
      Get.snackbar("Item Count", "You can't add more",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return maxValue;
    }
    return this;
  }
}

class GetxUtils{
  static void SnackBar(String title, {String desc = ""}) {
    Get.snackbar(title, desc,
        duration: Duration(milliseconds: 1000),
        animationDuration: Duration(milliseconds: 250),
        backgroundColor: Colors.transparent);
  }
}
