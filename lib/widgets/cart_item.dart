import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_project_miaged/data/providers/cart_provider.dart';
import 'package:flutter_app_project_miaged/data/models/item.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.item});
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          margin: const EdgeInsets.only(bottom: 10.0),
          child: ListTile(
            title: Text(item.title),
            subtitle: Row(
              children: [
                Text('${item.price}€'),
                const Spacer(),
                Text('T: ${item.size}'),
              ],
            ),
            trailing: IconButton(
              onPressed: () =>
                  ref.read(cartStateProvider.notifier).removeItemFromCart(item),
              icon: const Icon(Icons.delete),
            ),
            leading: Container(
              color: Colors.white,
              child: CachedNetworkImage(
                imageUrl: item.url,
                width: 80,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        );
      },
    );
  }
}
