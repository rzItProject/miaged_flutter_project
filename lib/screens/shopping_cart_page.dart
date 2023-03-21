import 'package:flutter/material.dart';
import 'package:flutter_app_project_miaged/data/providers/cart_provider.dart';
import 'package:flutter_app_project_miaged/data/models/item.model.dart';
import 'package:flutter_app_project_miaged/utils/utils.dart';
import 'package:flutter_app_project_miaged/widgets/cart_item.dart';
// import 'package:flutter_app_project_miaged/widgets/top_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShoppingCartPage extends ConsumerWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(cartStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Panier',
            style: kTitleStyle.copyWith(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w500)),
        backgroundColor: Colors.black54,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /* const TopContainer(
                title: 'PANIER',
              ), */
              const SizedBox(
                height: 20,
              ),
              Text("Total article(s) : ${items.length}"),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    Item item = items[index];
                    return CartItem(item: item);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
