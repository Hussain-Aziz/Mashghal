import 'package:get/get.dart';
import 'package:mushaghal/controllers/cart_controller.dart';
import 'package:mushaghal/controllers/product_controller.dart';
import 'package:mushaghal/data/api/api_client.dart';
import 'package:mushaghal/data/repository/cart_repo.dart';
import 'package:mushaghal/utils/consts.dart';
import 'package:mushaghal/data/repository/product_repo.dart';

Future<void> init() async {
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConsts.baseUrl), fenix: true);

  Get.lazyPut(() => ProductRepo(apiClient: Get.find()), fenix: true);
  Get.lazyPut(() => CartRepo(), fenix: true);

  Get.lazyPut(() => ProductController(productRepo: Get.find()), fenix: true);
  Get.lazyPut(() => CartController(cartRepo: Get.find()), fenix: true);
}
