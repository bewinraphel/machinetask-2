import 'package:machinetask/data/datasource/product_database.dart';
import 'package:machinetask/models/cart_item_model.dart';
import 'package:machinetask/models/product_model.dart';

class CartRepository {
  Future<void> addToCart(ProductModel product) async {
    await DBProductHelper.addToCart(product);
  }

  Future<List<CartModel>> fetchCartItems() async {
    return await DBProductHelper.fetchCart();
  }

  Future<void> incrementQty(int productId) async {
    await DBProductHelper.increment(productId);
  }

  Future<void> decrementQty(int productId) async {
    await DBProductHelper.decrement(productId);
  }

  Future<int> getTotalAmount() async {
    return await DBProductHelper.totalAmount();
  }
}
