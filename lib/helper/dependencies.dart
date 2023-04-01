import 'package:get/get.dart';
import 'package:mushaghal/controllers/cart_controller.dart';
import 'package:mushaghal/controllers/popular_product_controller.dart';
import 'package:mushaghal/controllers/recommended_product_controller.dart';
import 'package:mushaghal/data/api/api_client.dart';
import 'package:mushaghal/data/repository/cart_repo.dart';
import 'package:mushaghal/data/repository/popular_product_repo.dart';
import 'package:mushaghal/data/repository/recommended_product_repo.dart';
import 'package:mushaghal/utils/consts.dart';

Future<void> init() async {
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConsts.baseUrl), fenix: true);

  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()), fenix: true);
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()), fenix: true);
  Get.lazyPut(() => CartRepo(), fenix: true);

  Get.lazyPut(() => PopularProductController(productRepo: Get.find()),
      fenix: true);
  Get.lazyPut(
      () => RecommendedProductController(productRepo: Get.find()),
      fenix: true);
  Get.lazyPut(() => CartController(cartRepo: Get.find()), fenix: true);
}
