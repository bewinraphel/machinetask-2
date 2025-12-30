 

import 'package:machinetask/data/datasource/product_database.dart';
import 'package:machinetask/models/product_model.dart';

class ProductRepository {
  Future<List<ProductModel>> getProducts() {
    return DBProductHelper.fetchProducts();
  }
}
