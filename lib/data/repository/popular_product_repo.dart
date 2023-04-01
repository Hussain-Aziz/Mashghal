import 'package:get/get.dart';
import 'package:mushaghal/data/api/api_client.dart';
import 'package:mushaghal/data/repository/product_repo.dart';
import 'package:mushaghal/utils/consts.dart';

class PopularProductRepo extends ProductRepo {
  PopularProductRepo({required super.apiClient});

  Future<Response> getProductList() async {
    return await apiClient.getData(AppConsts.popularProductUri);
  }
}
