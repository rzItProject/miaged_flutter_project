import 'package:flutter_app_project_miaged/models/item.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemsNotifier extends StateNotifier<List<Item>> {
  ItemsNotifier() : super([]);

  void setItems(List<Item> items) {
    state = items;
  }

  void addItem(Item item) {
    state = [...state, item];
  }

  void removeItem(Item item) {
    state = state.where((i) => i.id != item.id).toList();
  }

  void clear() {
    state = [];
  }
}
