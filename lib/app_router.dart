import 'package:flutter/material.dart';
import 'package:flutter_app_project_miaged/screens/authentication/register_page.dart';
import 'package:flutter_app_project_miaged/screens/authentication/signin_page.dart';
import 'package:flutter_app_project_miaged/screens/home_page.dart';
import 'package:flutter_app_project_miaged/auth_checker.dart';
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

/* class AppRouter {
  static Route<MaterialPageRoute> onGenerateRoute(RouteSettings routeSettings) {
    late final Widget selectedPage;
    switch (routeSettings.name) {
      case treePage:
        selectedPage = const AuthChecker();
        break;
      case signInPage:
        selectedPage = SignInPage();
        break;
      case registerPage:
        selectedPage = RegisterPage();
        break;
      case homePage:
        selectedPage = const HomePage();
        break;
      default:
        selectedPage = const AuthChecker();
    }

    return MaterialPageRoute(
      builder: (context) => selectedPage,
    );
  }
} */
