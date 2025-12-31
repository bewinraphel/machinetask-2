import 'package:flutter/material.dart';
import 'package:machinetask/core/constants.dart';

class ImageSection extends StatelessWidget {
  double height;
  String? image;
  bool? favorite;
  bool? bestseller;
  ImageSection({
    super.key,
    this.height = 160,
    required this.favorite,
    required this.bestseller,
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
              bestseller == true
                  ? Container(
                      height: 24,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: ColorConstants.appbarleading,
                      ),
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
                    )
                  : SizedBox(),
              Icon(
                Icons.favorite_border,
                size: 30,
                color: favorite == true
                    ? ColorConstants.grey
                    : ColorConstants.red,
              ),
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
  final String name;
  const BrandNameSection({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        fontSize: 14,
        color: ColorConstants.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
