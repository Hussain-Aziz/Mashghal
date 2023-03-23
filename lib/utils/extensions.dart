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
