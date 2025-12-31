import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:machinetask/core/config/enum.dart';
import 'package:machinetask/core/config/route.dart';
import 'package:machinetask/core/constants.dart';
import 'package:machinetask/core/widget/customappbar.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      title: 'MVVM Cart App',
      theme: ThemeData(colorSchemeSeed: Colors.orange, useMaterial3: true),
    );
  }
}

class MainWrapperScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainWrapperScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const Customappbar(),
        body: navigationShell,
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            color: ColorConstants.black.withValues(alpha: 0.2),
            offset: const Offset(0, -1),
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: NavigationBar(
        backgroundColor: ColorConstants.white,
        indicatorColor: ColorConstants.white,
        selectedIndex: navigationShell.currentIndex,

        onDestinationSelected: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        destinations: AppTab.values.map((tab) {
          return NavigationDestination(
            icon: Icon(tab.icon, fontWeight: FontWeight.w500, size: 29),
            selectedIcon: Icon(tab.icon, color: ColorConstants.black, size: 34),
            label: tab.label,
          );
        }).toList(),
      ),
    );
  }
}
