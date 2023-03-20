import 'package:get/get.dart';
import 'package:mushaghal/data/repository/popular_product_repo.dart';
import 'package:mushaghal/models/product.dart';
import 'package:mushaghal/models/product_model.dart';
import 'package:mushaghal/utils/extensions.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
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
