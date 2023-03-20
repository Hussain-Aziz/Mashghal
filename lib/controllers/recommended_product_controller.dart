import 'package:get/get.dart';
import 'package:mushaghal/data/repository/recommended_product_repo.dart';
import 'package:mushaghal/models/product.dart';
import 'package:mushaghal/models/product_model.dart';
import 'package:mushaghal/utils/extensions.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});

  List<ProductModel> _recommendedProductList = [];
  List<ProductModel> get recommendedProductList => _recommendedProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }

    void setQuantity({bool decrement = false}) {
    if (!decrement) {
      _quantity += 1;
    } else {
      _quantity -= 1;
    }
    _quantity = _quantity.clampWithWarning(0, 20);
    update();
  }
}
