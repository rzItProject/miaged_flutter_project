import 'package:flutter_app_project_miaged/models/item.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartState extends StateNotifier<List<Item>> {
  CartState() : super([]);

  List<Item> getItems() {
    return state;
  }

  void setItems(List<Item> items) {
    state = items;
  }

  void addItemToCart(Item item) {
    state = [...state, item];
  }

  void removeItemFromCart(Item item) {
    state = state.where((i) => i.id != item.id).toList();
  }

  void clearCart() {
    state = [];
  }
}

/* class CartState extends StateNotifier<List<CartItem>> {
  CartState() : super([]);

  void addItem(Item item) {
    final index = state.indexWhere((items) => items.productId == item.id);

    if (index == -1) {
      state.add(CartItem(productId: item.id));
    } else {
      state[index].quantity++;
    }
  }

  void removeItem(String productId) {
    state.removeWhere((item) => item.productId == productId);
  }

  void updateItem(String productId, int quantity) {
    final index = state.indexWhere((item) => item.productId == productId);

    if (quantity <= 0) {
      removeItem(productId);
    } else if (index != -1) {
      state[index].quantity = quantity;
    }
  }

  /*  double get totalPrice {
    double total = 0.0;
    for (CartItem cartItem in state) {
      Item item = state.firstWhere((element) => element.productId == cartItem.productId);
      total += cartItem.quantity * double.parse(item.price);
    }
    return total;
  } */
} */