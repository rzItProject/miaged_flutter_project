import 'package:flutter_app_project_miaged/data/models/item.model.dart';
import 'package:flutter_app_project_miaged/services/cart_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartStateProvider =
    StateNotifierProvider<CartState, List<Item>>((ref) => CartState());
