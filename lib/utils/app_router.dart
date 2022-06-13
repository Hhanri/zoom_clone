import 'package:flutter/material.dart';
import 'package:zoom_clone/pages/home_page/home_page.dart';
import 'package:zoom_clone/pages/login_page/login_page.dart';

class AppRouter {
  Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case logInRoute: return returnPage(const LoginPage());
      case gameRoute: return returnPage(const HomePage());
      default: return returnPage(const LoginPage());
    }
  }
  static const String logInRoute = "/logIn";
  static const String gameRoute = "/home";

  static void navigateTo({required BuildContext context, required String route}) {
    Future.microtask(() {
      print("navigating to route");
      Navigator.of(context).pushNamedAndRemoveUntil(route, (route) => false);
    });
  }
  MaterialPageRoute returnPage(Widget child) {
    return MaterialPageRoute(builder: (_) => child);
  }
  
}