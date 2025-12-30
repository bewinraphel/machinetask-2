import 'package:flutter/material.dart';
import 'package:machinetask/core/constants.dart';
import 'package:machinetask/core/extension/custompaint.dart';
 
import 'package:machinetask/models/product_model.dart';
import 'package:machinetask/view/home/widget/widget.dart';
import 'package:machinetask/viewmodel/cart_model.dart';
 
import 'package:provider/provider.dart';

class DetailedSection extends StatelessWidget {
  double height;
  ProductModel product;
  DetailedSection({super.key, this.height = 160, required this.product});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * 0.95;
    final double height = MediaQuery.of(context).size.height * 0.50;
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: CustomPaint(
          painter: GradientBorderPainter(),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              padding: EdgeInsets.only(left: 12, right: 12, top: 18),
              decoration: BoxDecoration(
                color: ColorConstants.white,
                borderRadius: BorderRadius.circular(50),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImagesSection(
                    favourite: product.favourite,
                    bestseller: product.bestseller,
                    image: product.image1,
                  ),
                  SizedBox(height: 3),
                  TextSection(name: product.description),
                  SizedBox(height: 1),
                  ButtonSection(price: product.price, product: product),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ImagesSection extends StatelessWidget {
  double height;
  bool? favourite;
  bool? bestseller;
  String? image;
  ImagesSection({
    super.key,
    this.height = 0.25,
    required this.favourite,
    required this.bestseller,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * 0.25;
    return SizedBox(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,

            child: SizedBox(
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(0),
                itemCount: 3,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 30);
                },
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                        width: 20,
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: ColorConstants.borderblue,
                          ),
                        ),
                      ),
                      Container(
                        height: 48,
                        width: 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(image!),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                ImageSection(
                  height: 200,
                  image: image,
                  favorite: favourite,
                  bestseller: bestseller,
                ),
                SizedBox(
                  height: 20,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 10);
                    },
                    scrollDirection: Axis.horizontal,

                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return CircleAvatar(
                        backgroundColor: ColorConstants.background,
                        radius: 5,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Stack(
              alignment: AlignmentGeometry.topRight,
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -10,
                  child: CustomPaint(
                    painter: GradientBorderPainter(),
                    child: Container(
                      height: 40,
                      width: 40,
                      margin: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: ColorConstants.background,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: DefaultTextStyle(
                          style: TextStyle(),
                          child: Text(
                            'X',
                            style: TextStyle(
                              fontSize: 30,
                              color: ColorConstants.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TextSection extends StatelessWidget {
  String name;
  TextSection({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * 0.07;
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: SizedBox(
        height: height,
        child: DefaultTextStyle(
          style: TextStyle(),
          child: Text(
            name,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.40,
              color: ColorConstants.black,
            ),
            maxLines: 3,

            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  int price;
  ProductModel product;
  ButtonSection({super.key, required this.price, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ButtonsDetailSection(text: 'See all Deatils', onpress: () {}),
          SizedBox(height: 10),
          Consumer<CartViewModel>(
            builder: (context, vm, _) {
              final isAdded = vm.isInCart(product.id);
              final quantity = vm.getProductQuantity(product.id);
              final totalAmount = vm.getProductTotal(product.id);

              return Column(
                children: [
                  ButtonsDetailSection(
                    onpress: () {
                      context.read<CartViewModel>().addToCart(product);
                    },
                    text: isAdded ? '\$$totalAmount' : 'Add to Cart',
                    textWeight: FontWeight.bold,
                    textSize: 20,
                    disabledColor: ColorConstants.foccusedcolor,
                    focusedColor: ColorConstants.foccusedcolor,
                    side: const WidgetStatePropertyAll(
                      BorderSide(color: ColorConstants.black, width: 2),
                    ),
                  ),
                  SizedBox(height: 10),

                  if (isAdded)
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
                                fontSize: 18,
                                color: ColorConstants.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 13),
                        GestureDetector(
                          onTap: () {
                            context.read<CartViewModel>().decrement(product.id);
                          },
                          child: Container(
                            height: 25,

                            width: 30,
                            decoration: BoxDecoration(
                              color: ColorConstants.background,
                              border: Border.all(
                                color: ColorConstants.background,
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.remove,
                                color: ColorConstants.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 13),
                        SizedBox(
                          child: DefaultTextStyle(
                            style: TextStyle(),
                            child: Text(
                              quantity.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                color: ColorConstants.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 13),
                        GestureDetector(
                          onTap: () {
                            context.read<CartViewModel>().increment(product.id);
                          },
                          child: Container(
                            height: 25,
                            color: ColorConstants.background,
                            width: 30,
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: ColorConstants.black,

                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class ButtonsDetailSection extends StatelessWidget {
  final double? height;
  final double? width;
  final String text;

  final FontWeight? textWeight;
  final double? textSize;
  final Color? disabledColor;
  final Color? focusedColor;
  final WidgetStateProperty<BorderSide?>? side;
  void Function()? onpress;
  ButtonsDetailSection({
    super.key,
    this.height = 35,
    this.width = 240,
    required this.onpress,
    required this.text,
    this.textWeight,
    this.textSize,
    this.disabledColor,
    this.focusedColor,
    this.side,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: OutlinedButton(
        onPressed: onpress,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.disabled)) {
              return disabledColor ?? ColorConstants.background;
            }
            if (states.contains(WidgetState.focused)) {
              return focusedColor ?? ColorConstants.foccusedcolor;
            }
            return Colors.transparent;
          }),

          side: side,

          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: ColorConstants.black,
            fontWeight: textWeight,
            fontSize: textSize,
          ),
        ),
      ),
    );
  }
}
