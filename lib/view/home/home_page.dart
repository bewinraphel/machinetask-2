import 'package:flutter/material.dart';
import 'package:machinetask/core/constants.dart';
  
import 'package:machinetask/view/home/widget/home_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Container(
          decoration: BoxDecoration(color: ColorConstants.white),
          child: Column(children: [Expanded(child: HomeSection())]),
        ),
      ),
    );
  }
}
