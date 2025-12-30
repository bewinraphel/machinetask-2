 import 'package:flutter/material.dart';
import 'package:machinetask/data/repository/cart_repository.dart';
import 'package:machinetask/models/cart_item_model.dart';
import 'package:machinetask/models/product_model.dart';
 

class CartViewModel extends ChangeNotifier {
  final CartRepository _repo = CartRepository();

  List<CartModel> cartItems = [];
  int total = 0;

  Future<void> loadCart() async {
    cartItems = await _repo.fetchCartItems();
    total = await _repo.getTotalAmount();
    notifyListeners();
  }

  Future<void> addToCart(ProductModel product) async {
    await _repo.addToCart(product);
    await loadCart();
  }

  Future<void> increment(int productId) async {
    await _repo.incrementQty(productId);
    await loadCart();
  }

  Future<void> decrement(int productId) async {
    await _repo.decrementQty(productId);
    await loadCart();
  }
  bool isInCart(int productId) {
  return cartItems.any((item) => item.productId == productId);
}
CartModel? getCartItem(int productId) {
  try {
    return cartItems.firstWhere(
      (item) => item.productId == productId,
    );
  } catch (_) {
    return null;
  }
}

int getProductQuantity(int productId) {
  return getCartItem(productId)?.quantity ?? 0;
}

int getProductTotal(int productId) {
  final item = getCartItem(productId);
  return item == null ? 0 : item.price * item.quantity;
}

}
