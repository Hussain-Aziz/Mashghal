import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mushaghal/controllers/cart_controller.dart';
import 'package:mushaghal/data/repository/popular_product_repo.dart';
import 'package:mushaghal/models/product.dart';
import 'package:mushaghal/models/product_model.dart';
import 'package:mushaghal/utils/colors.dart';
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
  late CartController _cart;

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

  void initProduct(CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
  }

  void addItem(ProductModel product) {
    if (quantity > 0) {
      _cart.addItem(product, quantity);
      _quantity = 0;
      update();
    } else {
      Get.snackbar("Item Count", "You should add atleast 1 item to the cart",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
    }
  }
}
