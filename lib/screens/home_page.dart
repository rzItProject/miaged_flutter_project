import 'package:flutter/material.dart';
import 'package:flutter_app_project_miaged/data/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod'),
      ),
      body: Center(
        child: user.when(
          data: (data) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "Vous êtes connecté en tant que ${data?.displayName ?? data?.email}"),
                ElevatedButton(
                  onPressed: () {
                    ref.read(authRepositoryProvider).signOut();
                  },
                  child: const Text("Déconnexion"),
                ),
              ],
            );
          },
          error: (error, stackTrace) {
            return Text(error.toString());
          },
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
