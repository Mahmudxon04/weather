import 'package:flutter/material.dart';
import 'package:weather/ui/search/search_screen.dart';

import 'home/home_screen.dart';

class RouteNames {
  static const String homeScreen = "/";
  static const String searchScreen = "/search_screen";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RouteNames.searchScreen:
        return MaterialPageRoute(
          builder: (context) =>  SearchScreen(onSearchTap: settings.arguments as VoidCallback ,),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route not found!"),
            ),
          ),
        );
    }
  }
}