//Entry point of shared data
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_project_miaged/data/repositories/database_repository.dart';
import 'package:flutter_app_project_miaged/models/item.model.dart';
import 'package:flutter_app_project_miaged/services/items_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryProvider = StateProvider<String>((ref) => 'chaussures');

final databaseRepositoryProvider = Provider<DatabaseRepository>(
    (ref) => DatabaseRepository(FirebaseFirestore.instance));

// Définir un objet Provider pour votre liste d'items
final itemsProvider = StateNotifierProvider((_) => ItemsNotifier());

final itemsStreamProvider = StreamProvider.autoDispose<List<Item>>((ref) {
  return ref.watch(databaseRepositoryProvider).getItems();
});

/* final itemByCategoryProvider =
    FutureProvider.family<List<Item>, String>((ref, category) {
  return ref.watch(databaseRepositoryProvider).getItemByCategory(category);
}); */

final itemsByCategoryProvider =
    FutureProvider.family<List<Item>, String>((ref, category) async {
  final api = ref.watch(databaseRepositoryProvider);
  final docs = await api.getItemsByCategory(category);
  return docs
      .map(
        (doc) => Item(
          id: doc.id,
          title: doc["title"],
          size: doc["size"],
          price: doc["price"],
          url: doc["url"],
          category: doc["category"],
        ),
      )
      .toList();
});
