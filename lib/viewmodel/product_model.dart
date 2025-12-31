import 'package:flutter/material.dart';
import 'package:machinetask/models/product_model.dart';
 
import '../data/repository/product_repository.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductRepository repository;

  ProductViewModel(this.repository);

  List<ProductModel> products = [];
  bool isLoading = false;

  Future<void> loadProducts() async {
    isLoading = true;
    notifyListeners();

    products = await repository.getProducts();

    isLoading = false;
    notifyListeners();
  }
}
