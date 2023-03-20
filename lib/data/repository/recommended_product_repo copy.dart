import 'package:get/get.dart';
import 'package:mushaghal/data/api/api_client.dart';
import 'package:mushaghal/utils/consts.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConsts.popularProductUri); 
  }
}
