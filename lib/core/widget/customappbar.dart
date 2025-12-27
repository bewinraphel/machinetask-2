import 'package:flutter/material.dart';
import 'package:machinetask/core/constants.dart';

class Customappbar extends StatelessWidget implements PreferredSizeWidget {
  const Customappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              ColorConstants.appbarleading,
              ColorConstants.appbaraction,
            ],
          ),
        ),
        height: preferredSize.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 20),
            Container(
              height: 56,
              width: 60,
              decoration: BoxDecoration(
                color: ColorConstants.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Icon(Icons.search, size: 50, color: ColorConstants.white),
            ),
            Container(
              height: 56,
              width: 240,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: ColorConstants.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.more_vert, size: 35, color: ColorConstants.black),
                ],
              ),
            ),
            SizedBox(width: 20),

            Container(
              height: 56,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                alignment: Alignment.topRight,

                clipBehavior: Clip.none,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 60,
                    color: ColorConstants.black,
                  ),
                  Positioned(
                    right: -3,
                    top: -3,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorConstants.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Badge.count(
                        count: 0,
                        textColor: ColorConstants.black,
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(900, 120);
}
