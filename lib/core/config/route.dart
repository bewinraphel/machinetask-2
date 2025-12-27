import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:machinetask/core/config/enum.dart';
import 'package:machinetask/core/debug/debug.dart';
import 'package:machinetask/myapp.dart';
import 'package:machinetask/view/cart/cart.dart';
import 'package:machinetask/view/home/home_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppTab.home.path,
  observers: [DebugObserver()],
  debugLogDiagnostics: true,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainWrapperScreen(navigationShell: navigationShell);
      },

      branches: [
        // Branch 1: Home
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppTab.home.path,
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
        // Branch 2: CartScreen
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppTab.cart.path,
              builder: (context, state) => const CartScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
