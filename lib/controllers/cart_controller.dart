import 'package:get/get.dart';
import 'package:mushaghal/data/repository/cart_repo.dart';
import 'package:mushaghal/models/cart_model.dart';
import 'package:mushaghal/models/product_model.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  void addItem(ProductModel product, int quantity) {
    if (_items.containsKey(product.id)) {
      _items.update(product.id!, (cartItem) {
        cartItem.quantity = cartItem.quantity! + quantity;
        cartItem.time = DateTime.now().toString();
        return cartItem;
      });
    } else {
      _items.putIfAbsent(
          product.id!,
          () => CartModel(
              id: product.id,
              name: product.name,
              img: product.img,
              quantity: quantity,
              isExists: true,
              time: DateTime.now().toString()));
    }
    if (_items[product.id]!.quantity == 0) {
      _items.remove(product.id);
    }
  }

  bool existsInCart(ProductModel product) {
    return _items.containsKey(product.id);
  }

  int getQuantity(ProductModel product) {
    return existsInCart(product) ? _items[product.id]!.quantity! : 0;
  }

  int get totalItems {
    int total = 0;
    _items.forEach((key, value) => total += value.quantity!);
    return total;
  }
}
