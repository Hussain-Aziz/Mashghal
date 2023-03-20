import 'package:get/get.dart';
import 'package:mushaghal/controllers/popular_product_controller.dart';
import 'package:mushaghal/controllers/recommended_product_controller.dart';
import 'package:mushaghal/data/api/api_client.dart';
import 'package:mushaghal/data/repository/popular_product_repo.dart';
import 'package:mushaghal/data/repository/recommended_product_repo.dart';
import 'package:mushaghal/utils/consts.dart';

Future<void> init() async {
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConsts.baseUrl));

  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));

  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
}
