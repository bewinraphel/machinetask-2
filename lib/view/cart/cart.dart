import 'package:flutter/material.dart';

import 'package:machinetask/view/cart/widget/cart_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Column(
          crossAxisAlignment: .center,
          children: [
            ProceedButtonsection(),
            CheckBoxSection(),
            SelectedItems(),
            SeeMoreButton(),
          ],
        ),
      ),
    );
  }
}
