import 'package:flutter/material.dart';

enum AppTab {
  home,
  cart;

  String get path {
    switch (this) {
      case AppTab.home:
        return '/home';
      case AppTab.cart:
        return '/cart';
    }
  }

  String get label {
    switch (this) {
      case AppTab.home:
        return 'Home';

      case AppTab.cart:
        return 'Cart';
    }
  }

  IconData get icon {
    switch (this) {
      case AppTab.home:
        return Icons.home;
      case AppTab.cart:
        return Icons.import_contacts_sharp;
    }
  }
}
