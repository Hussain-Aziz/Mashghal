import 'package:get/get.dart';
import 'package:mushaghal/data/api/api_client.dart';
import 'package:mushaghal/utils/consts.dart';

abstract class ProductRepo extends GetxService {
  final ApiClient apiClient;

  ProductRepo({required this.apiClient});

  Future<Response> getProductList();
}
