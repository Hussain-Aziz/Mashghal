import 'package:get/get.dart';
import 'package:mushaghal/data/api/api_client.dart';
import 'package:mushaghal/data/repository/product_repo.dart';
import 'package:mushaghal/utils/consts.dart';

class RecommendedProductRepo extends ProductRepo {
  RecommendedProductRepo({required super.apiClient});

  Future<Response> getProductList() async {
    return await apiClient.getData(AppConsts.recommendedProductUri);
  }
}
