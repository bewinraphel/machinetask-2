import 'package:flutter/material.dart';

class DebugObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    print('DEBUG NAV: Pushed ${route.settings.name} (Current: ${route.settings.name})');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    print('DEBUG NAV: Popped ${route.settings.name} (Now showing: ${previousRoute?.settings.name})');
  }
}