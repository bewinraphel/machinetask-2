import 'package:flutter/material.dart';
import 'package:machinetask/core/constants.dart';

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

class SeeMoreButton extends StatelessWidget {
  const SeeMoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      crossAxisAlignment: .center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 19),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.81,
            child: Divider(thickness: 1, color: ColorConstants.black),
          ),
        ),
        Container(
          height: 36,
          width: 150,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: ColorConstants.proceeedButton),
            border: Border.all(color: ColorConstants.borderblack, width: 2),
            borderRadius: BorderRadius.circular(20),

            color: ColorConstants.white,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 9, right: 9),
              child: Text(
                'See more like these',
                style: TextStyle(fontSize: 13),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
