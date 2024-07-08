import 'package:flutter/material.dart';

class AppRoute {
  static const home = '/home';
  static const detail = '/detail';
}

Route<dynamic> appRoute(RouteSettings settings) {
  switch (settings.name) {
    // TODO: 2. Tambahkan route

    default:
      return MaterialPageRoute(builder: (_) => const Placeholder());
  }
}
