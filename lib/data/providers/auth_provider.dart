import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_project_miaged/data/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Entry point of shared data
final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepository(FirebaseAuth.instance));

final authStateProvider = StreamProvider.autoDispose<User?>((ref) {
  return ref.watch(authRepositoryProvider).onAuthStateChanges;
});
