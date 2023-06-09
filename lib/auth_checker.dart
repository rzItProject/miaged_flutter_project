import 'package:flutter/material.dart';
import 'package:flutter_app_project_miaged/data/providers/auth_customer_provider.dart';
import 'package:flutter_app_project_miaged/screens/authentication/signin_page.dart';
import 'package:flutter_app_project_miaged/screens/home_page.dart';
// import 'package:flutter_app_project_miaged/screens/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
      data: (user) {
        if (user != null) {
          return const HomePage();
          // return const HomeScreen();
        }
        return SignInPage();
      },
      loading: () => const SplachScreen(),
      error: (error, stackTrace) => SignInPage(),
    );
  }
}

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SizedBox(
      height: 100,
      width: 100,
      child: CircularProgressIndicator(),
    ));
  }
}
