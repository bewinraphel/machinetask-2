import 'package:flutter/material.dart';
import 'package:machinetask/core/constants.dart';

class ImageSection extends StatelessWidget {
  double height;
  String? image;
  ImageSection({
    super.key,
    this.height = 160,
    this.image = 'assets/images/product1.jpeg',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,

      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image!), fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 24,
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(color: ColorConstants.appbarleading),
                child: DefaultTextStyle(
                  style: TextStyle(),
                  child: Text(
                    'Best Seller',
                    style: TextStyle(
                      fontSize: 15,
                      color: ColorConstants.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Icon(Icons.favorite_border, size: 30, color: ColorConstants.grey),
            ],
          ),
        ],
      ),
    );
  }
}

class OffSection extends StatelessWidget {
  const OffSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 33,
          width: 70,

          decoration: BoxDecoration(color: ColorConstants.red),
          child: Center(
            child: Text(
              '50% Off',
              style: TextStyle(
                fontSize: 17,
                color: ColorConstants.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Wrap(
          children: [
            Text(
              'Deal of the  \nDay',
              style: TextStyle(
                fontSize: 13,
                color: ColorConstants.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class BrandNameSection extends StatelessWidget {
  const BrandNameSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Bronson Analog watch - For Men FS5852',
      style: TextStyle(
        fontSize: 14,
        color: ColorConstants.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
