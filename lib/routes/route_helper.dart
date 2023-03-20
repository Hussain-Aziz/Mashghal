import 'package:get/get.dart';
import 'package:mushaghal/pages/home/main_item_page.dart';
import 'package:mushaghal/pages/items/popular_item_detail.dart';
import 'package:mushaghal/pages/items/recomended_item_detail.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularItem = "/popular-item";
  static const String recommendedItem = "/recommended-item";

  static String getInitial() => initial;
  static String getPopularItem(int pageId) => "$popularItem?pageId=$pageId";
  static String getRecommendedItem(int pageId) =>
      "$recommendedItem?pageId=$pageId";

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainItemPage()),
    GetPage(
        name: popularItem,
        page: () {
          var pageId = int.parse(Get.parameters['pageId']!);
          return PopularItemDetail(pageId: pageId);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedItem,
        page: () {
          var pageId = int.parse(Get.parameters['pageId']!);
          return RecommendedItemDetail(pageId: pageId);
        },
        transition: Transition.fadeIn),
  ];
}
