import 'package:flutter/material.dart';
import 'package:machinetask/core/constants.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Column(children: [ProceedButtonsection()]),
      ),
    );
  }
}

class ProceedButtonsection extends StatelessWidget {
  const ProceedButtonsection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Subtotal \$99.00',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19,
            wordSpacing: 1.4,
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Text.rich(
            TextSpan(
              text: 'EMI Available',
              children: <InlineSpan>[
                TextSpan(
                  text: '     Details',

                  style: TextStyle(
                    color: ColorConstants.appbaraction,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
          
        )
      ],
    );
  }
}
