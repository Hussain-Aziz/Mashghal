import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageViewHeight = 320.scale();
  static double pageViewImageHeight = 220.scale();
  static double pageViewTextHeight = 120.scale();
  static double listViewImageSize = 120.scale(horizontal: true);
  static double listViewTextContainerSize = 100.scale(horizontal: true);
  static double popularItemImageSize = 350.scale();
  static double bottomBarHeight = 130.scale();
}

extension ScaleWithScreenDouble on double {
  double scale({bool horizontal = false}) {
    return !horizontal
        ? this * Dimensions.screenHeight / 844
        : this * Dimensions.screenWidth / 390;
  }
}

extension ScaleWithScreenInt on int {
  double scale({bool horizontal = false}) {
    return !horizontal
        ? this * Dimensions.screenHeight / 844
        : this * Dimensions.screenWidth / 390;
  }
}
