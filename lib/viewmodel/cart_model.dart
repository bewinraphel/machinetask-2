import 'package:flutter/material.dart';
import 'package:machinetask/data/models/cart_item_model.dart';
import 'package:machinetask/data/repository/cart_repository.dart';
 

class CartViewModel extends ChangeNotifier {
  final CartRepository _repo;

  CartViewModel(this._repo);

  List<CartItemModel> _items = [];

  List<CartItemModel> get cartItems =>
      _items.where((e) => !e.savedForLater).toList();

  List<CartItemModel> get savedItems =>
      _items.where((e) => e.savedForLater).toList();

  double get subtotal => cartItems.fold(
        0,
        (sum, item) => sum + item.price * item.quantity,
      );

  Future<void> loadCart() async {
    _items = await _repo.getCartItems();
    notifyListeners();
  }

  void addItem(CartItemModel item) {
    final index = _items.indexWhere((e) => e.id == item.id);
    if (index != -1) {
      _items[index].quantity++;
    } else {
      _items.add(item);
    }
    _repo.saveItem(item);
    notifyListeners();
  }

  void increment(int id) {
    final item = _items.firstWhere((e) => e.id == id);
    item.quantity++;
    _repo.saveItem(item);
    notifyListeners();
  }

  void decrement(int id) {
    final item = _items.firstWhere((e) => e.id == id);
    if (item.quantity > 1) {
      item.quantity--;
      _repo.saveItem(item);
      notifyListeners();
    }
  }

  void toggleSave(int id) {
    final item = _items.firstWhere((e) => e.id == id);
    item.savedForLater = !item.savedForLater;
    _repo.saveItem(item);
    notifyListeners();
  }

  void deleteItem(int id) {
    _items.removeWhere((e) => e.id == id);
    _repo.removeItem(id);
    notifyListeners();
  }
}
