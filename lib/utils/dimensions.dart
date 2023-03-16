import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double l5 = screenHeight / 168.8;
  static double l10 = screenHeight / 84.4;
  static double l15 = screenHeight / 56.27;
  static double l20 = screenHeight / 42.2;
  static double l24 = screenHeight / 35.17;
  static double l26 = screenHeight / 32.46;
  static double l30 = screenHeight / 28.13;
  static double l40 = screenHeight / 21.1;
  static double l45 = screenHeight / 18.76;
  static double l80 = screenHeight / 1.055;

  /*84.4: 10
  56.27: 15
  42.2: 20
  28.13: 30
  35.17: 24
  */
  static double pageViewHeight = screenHeight / 2.64;
  static double pageViewImageHeight = screenHeight / 3.84;
  static double pageViewTextHeight = screenHeight / 7.03;
  static double listViewImageSize = screenWidth / 3.25;
  static double listViewTextContainerSize = screenWidth / 3.9;
  static double popularItemImageSize = screenHeight / 2.41;
  static double iconSize24 = screenHeight / 35.17;
  static double iconSize16 = screenHeight / 52.75;
  static double bottomBarHeight = screenHeight / 7.03;
}
