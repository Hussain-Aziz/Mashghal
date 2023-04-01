import 'package:get/get.dart';
import 'package:mushaghal/controllers/cart_controller.dart';
import 'package:mushaghal/data/repository/product_repo.dart';
import 'package:mushaghal/models/product.dart';
import 'package:mushaghal/models/product_model.dart';
import 'package:mushaghal/utils/extensions.dart';

abstract class ProductController<T> extends GetxController {
  final T productRepo;

  ProductController({required this.productRepo});

  List<ProductModel> _productList = [];
  List<ProductModel> get productList => _productList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int _tempQuantity = 0;
  int _inCartItems = 0;
  int get totalItems => _inCartItems + _tempQuantity;
  late CartController _cart;

  Future<void> getProductList() async {
    ;
    Response response = await (productRepo as ProductRepo).getProductList();
    if (response.statusCode == 200) {
      _productList = [];
      _productList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }

  void addQuantity({bool decrement = false}) {
    if (!decrement) {
      _tempQuantity += 1;
      update();
    } else {
      if (totalItems <= 0) {
        GetxUtils.SnackBar("Item Count", desc: "You can't reduce more");
      } else {
        _tempQuantity -= 1;
        update();
      }
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _tempQuantity = 0;
    _inCartItems = 0;
    _cart = cart;
    if (_cart.existsInCart(product)) {
      _inCartItems = _cart.getQuantity(product);
    }
  }

  void addItem(ProductModel product) {
    if (totalItems >= 0) {
      _cart.addItem(product, _tempQuantity);
      _inCartItems += _tempQuantity;
      _tempQuantity = 0;
      GetxUtils.SnackBar("Added Sucessfully");
      update();
    } else {
      GetxUtils.SnackBar("Item Count",
          desc: "You should add atleast 1 item to the cart");
    }
  }

  int get totalCartItems => _cart.totalItems;
}
