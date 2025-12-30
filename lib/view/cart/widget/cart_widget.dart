import 'package:flutter/material.dart';
import 'package:machinetask/core/constants.dart';
import 'package:machinetask/models/cart_item_model.dart';

import 'package:machinetask/viewmodel/cart_model.dart';
import 'package:provider/provider.dart';

class ProceedButtonsection extends StatelessWidget {
  const ProceedButtonsection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(
      builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              'Subtotal \$${value.total}.00',
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
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: SizedBox(
                height: 35,
                child: Row(
                  crossAxisAlignment: .end,
                  children: [
                    CircleAvatar(
                      backgroundColor: ColorConstants.doneButton,
                      radius: 20,
                      child: Icon(
                        Icons.done,
                        color: ColorConstants.white,
                        size: 30,
                      ),
                    ),
                    SizedBox(width: 4),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Free Deliver Available.',
                            style: TextStyle(
                              fontSize: 12,
                              letterSpacing: 0.50,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'select this option to checkout.',
                            style: TextStyle(
                              fontSize: 12,
                              letterSpacing: 0.50,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      ' Details',

                      style: TextStyle(
                        color: ColorConstants.appbaraction,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: AlignmentGeometry.center,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.80,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side: BorderSide.none,
                    padding: EdgeInsets.zero,
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: ColorConstants.proceeedButton,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 24,
                      ),
                      child: Text(
                        'Proceed to Buy (${value.cartItems.length} item)',
                        style: TextStyle(
                          fontSize: 15,
                          color: ColorConstants.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.81,
                child: Divider(thickness: 1, color: ColorConstants.black),
              ),
            ),
          ],
        );
      },
    );
  }
}

class CheckBoxSection extends StatelessWidget {
  const CheckBoxSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          SizedBox(
            height: 40,
            child: Row(
              crossAxisAlignment: .center,
              mainAxisAlignment: .start,
              children: [
                Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                    side: BorderSide(
                      color: ColorConstants.black.withValues(alpha: .30),
                    ),
                    fillColor: WidgetStatePropertyAll<Color>(
                      ColorConstants.white,
                    ),
                    value: false,
                    onChanged: (value) {},
                  ),
                ),
                Text('Select all items'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductSection extends StatelessWidget {
  final CartModel cart;
  const ProductSection({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.37,
      child: Column(
        mainAxisAlignment: .start,
        crossAxisAlignment: .start,
        children: [
          SizedBox(height: 40),
          SizedBox(
            height: 160,
            width: MediaQuery.of(context).size.width * 0.38,
            child: Image.asset(cart.image, fit: BoxFit.cover),
          ),
          SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: DefaultTextStyle(
                  style: TextStyle(),
                  child: Text(
                    'Qty:',
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorConstants.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  context.read<CartViewModel>().decrement(cart.id!);
                },
                child: Container(
                  height: 20,

                  width: 20,
                  decoration: BoxDecoration(
                    color: ColorConstants.background,
                    border: Border.all(
                      color: ColorConstants.appbarleading,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.remove,
                      size: 19,
                      color: ColorConstants.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              SizedBox(
                child: DefaultTextStyle(
                  style: TextStyle(),
                  child: Text(
                    '${cart.quantity}',
                    style: TextStyle(
                      fontSize: 15,
                      color: ColorConstants.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 13),
              GestureDetector(
                onTap: () {
                  context.read<CartViewModel>().increment(cart.id!);
                },
                child: Container(
                  height: 20,
                  decoration: BoxDecoration(
                    color: ColorConstants.background,
                    border: Border.all(
                      color: ColorConstants.appbarleading,
                      width: 1,
                    ),
                  ),
                  width: 20,

                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: ColorConstants.black,
                      size: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CheackSection extends StatelessWidget {
  const CheackSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.5,
      child: Checkbox(
        side: BorderSide(color: ColorConstants.black.withValues(alpha: .30)),
        fillColor: WidgetStatePropertyAll<Color>(ColorConstants.doneButton),
        value: true,
        tristate: true,
        onChanged: (bool? value) {},
      ),
    );
  }
}

class SelectedItems extends StatelessWidget {
  const SelectedItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.only(left: 14, right: 14),
          child: Container(
            color: ColorConstants.background,
            height: 250,

            child: ListView.builder(
              shrinkWrap: true,
              itemCount: value.cartItems.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  child: Row(
                    crossAxisAlignment: .start,
                    mainAxisAlignment: .start,
                    children: [
                      CheackSection(),
                      ProductSection(cart: value.cartItems[index]),
                      DeleteSaveSecrion(cart: value.cartItems[index]),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class DeleteSaveSecrion extends StatelessWidget {
  final CartModel cart;
  const DeleteSaveSecrion({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.38,
      child: Column(
        children: [
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Text(
              cart.name,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,

                wordSpacing: 1,
                color: ColorConstants.black,
              ),
              maxLines: 10,

              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '\$${cart.price}',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,

              color: ColorConstants.black,
            ),
            maxLines: 10,

            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Container(
                height: 36,
                width: 75,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorConstants.borderblack,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(9),
                  color: ColorConstants.white,
                ),
                child: Center(
                  child: Text('Delete', style: TextStyle(fontSize: 10)),
                ),
              ),
              Container(
                height: 36,
                width: 75,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorConstants.borderblack,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(9),
                  color: ColorConstants.white,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 9, right: 9),
                    child: Text(
                      'Save for later',
                      style: TextStyle(fontSize: 8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
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
