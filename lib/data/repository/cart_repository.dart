import '../datasource/cart_db.dart';
import '../models/cart_item_model.dart';

class CartRepository {
  Future<List<CartItemModel>> getCartItems() {
    return CartDb.fetchItems();
  }

  Future<void> saveItem(CartItemModel item) {
    return CartDb.insertItem(item);
  }

  Future<void> removeItem(int id) {
    return CartDb.deleteItem(id);
  }
}
