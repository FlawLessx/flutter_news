import 'package:flutter/material.dart';
import 'package:myapp/pages/detail/detail_page.dart';
import 'package:myapp/pages/home/home_page.dart';

class AppRoute {
  static const home = '/';
  static const detail = '/detail';
}

Route<dynamic> appRoute(RouteSettings settings) {
  switch (settings.name) {
    // Ketika navigasi ke rute "/", akan menghasilkan widget HomePage.
    case AppRoute.home:
      return MaterialPageRoute(builder: (_) => const HomePage());
    // When navigating to the "/second" route, build the SecondScreen widget.
    case AppRoute.detail:
      return MaterialPageRoute(
          builder: (_) =>
              DetailPage(args: settings.arguments as DetailPageArgs));
    default:
      return MaterialPageRoute(builder: (_) => const Placeholder());
  }
}
