//Entry point of shared data
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_project_miaged/data/repositories/database_repository.dart';
import 'package:flutter_app_project_miaged/models/item.model.dart';
import 'package:flutter_app_project_miaged/services/database_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final databaseRepositoryProvider = Provider<DatabaseRepository>(
    (ref) => DatabaseRepository(FirebaseFirestore.instance));

// Définir un objet Provider pour votre liste d'items
final itemsProvider = StateNotifierProvider((_) => ItemsNotifier());

final itemsStreamProvider = StreamProvider.autoDispose<List<Item>>((ref) {
  return ref.watch(databaseRepositoryProvider).getItems();
});
