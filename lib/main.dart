import 'package:flutter/material.dart';
import 'package:machinetask/data/repository/cart_repository.dart';
import 'package:machinetask/myapp.dart';
import 'package:machinetask/viewmodel/cart_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartViewModel(CartRepository())..loadCart(),
      child: const MyApp(),
    ),
  );
}
