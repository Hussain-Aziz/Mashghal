import 'package:get/get.dart';
import 'package:mushaghal/utils/consts.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  late String appBaseUrl;
  bool isLocal = false;

  late Map<String, String> _mainHeaders;

  ApiClient({String? appBaseUrl = null}) {
    if (appBaseUrl != null) {
      this.appBaseUrl = appBaseUrl;
      baseUrl = appBaseUrl;
      timeout = const Duration(seconds: 30);
      token = AppConsts.token;
      _mainHeaders = {
        'Content-type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      };
    } else {
      isLocal = true;
    }
  }

  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
