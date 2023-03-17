import 'package:flutter/material.dart';
import 'package:flutter_app_project_miaged/data/providers/auth_provider.dart';
import 'package:flutter_app_project_miaged/screens/authentication/signin_page.dart';
import 'package:flutter_app_project_miaged/screens/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
      data: (user) {
        if (user != null) {
          // return const HomePage();
          return const HomeScreen();
        }
        return SignInPage();
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => SignInPage(),
    );
  }

  /* @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    if (authState.value != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigation.appNavigation.currentState!.pushReplacementNamed(homePage);
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigation.nestedNavigation = GlobalKey();

        Navigation.appNavigation.currentState!
            .pushNamedAndRemoveUntil(signInPage, (route) => route.isFirst);
      });
    }

    return const SizedBox.shrink();
  } */
}

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
