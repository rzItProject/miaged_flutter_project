import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentPageProvider =
    StateNotifierProvider.autoDispose<CurrentPageNotifier, int>(
        (ref) => CurrentPageNotifier());

class CurrentPageNotifier extends StateNotifier<int> {
  CurrentPageNotifier() : super(0);

  void setPage(int index) {
    state = index;
  }
}
