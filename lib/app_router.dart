import 'package:flutter/material.dart';
import 'package:flutter_app_project_miaged/screens/authentication/register_page.dart';
import 'package:flutter_app_project_miaged/screens/authentication/signin_page.dart';
import 'package:flutter_app_project_miaged/auth_checker.dart';
import 'package:flutter_app_project_miaged/screens/home_page.dart';
// import 'package:flutter_app_project_miaged/screens/home_screen.dart';
import 'package:flutter_app_project_miaged/utils/constants.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case treePage:
        return MaterialPageRoute(builder: (_) => const AuthChecker());
      case signInPage:
        return MaterialPageRoute(builder: (_) => SignInPage());
      case registerPage:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case homePage:
        // return MaterialPageRoute(builder: (_) => const HomeScreen());
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child:
                          Text('No route defined for ${routeSettings.name}')),
                ));
    }
  }
}
