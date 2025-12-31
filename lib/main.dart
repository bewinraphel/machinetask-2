import 'package:flutter/material.dart';

import 'package:machinetask/data/repository/product_repository.dart';

import 'package:machinetask/myapp.dart';
import 'package:machinetask/viewmodel/cart_model.dart';

import 'package:machinetask/viewmodel/product_model.dart';
import 'package:machinetask/viewmodel/quantitiy_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductViewModel(ProductRepository())..loadProducts(),
        ),
        ChangeNotifierProvider(create: (_) => CartViewModel()..loadCart()),
        ChangeNotifierProvider(create: (_) => QuantityViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}
