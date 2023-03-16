import 'package:flutter/material.dart';
import 'package:flutter_app_project_miaged/data/providers/auth_provider.dart';
import 'package:flutter_app_project_miaged/data/providers/database_provider.dart';
import 'package:flutter_app_project_miaged/models/item.model.dart';
import 'package:flutter_app_project_miaged/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProductPage extends ConsumerWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final databaseRepository = ref.watch(databaseRepositoryProvider);
    final itemsStream = ref.watch(itemsStreamProvider);
    final notifier = ref.watch(itemsProvider.notifier);
    final items = itemsStream.value ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text(product),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(authRepositoryProvider).signOut();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context).pushNamed(Routes.favourite);
        },
        child: const Icon(Icons.shopping_bag_outlined),
      ),
      body: Container(
        // height: 140,
        child: ListView.builder(
          itemCount: items.length,
          // scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              // padding: const EdgeInsets.symmetric(horizontal: 8.0),
              padding: const EdgeInsets.all(10),
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
                child: ListTile(
                  title: Text(items[index].title),
                  subtitle: Text(items[index].url),
                ),
              ),
            );
            /* return Slidable(
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (c) {
                      ref
                          .read(databaseRepositoryProvider)
                          .deleteItem(items[index].id);
                    },
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                    spacing: 8,
                  ),
                ],
              ),
              child: ListTile(
                title: Text(items[index].title),
                subtitle: Text(items[index].size),
              ),
            ); */
          },
        ),
      ),
    );
  }
}
