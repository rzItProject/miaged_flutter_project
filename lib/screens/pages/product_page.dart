import 'package:flutter/material.dart';
import 'package:flutter_app_project_miaged/data/providers/database_provider.dart';
import 'package:flutter_app_project_miaged/widgets/product_display.dart';
import 'package:flutter_app_project_miaged/widgets/top_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductPage extends ConsumerWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsStream = ref.watch(itemsStreamProvider);
    final items = itemsStream.value ?? [];

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
        child: Column(
          children: <Widget>[
            const TopContainer(
              title: 'MIAGED',
              searchBarTitle: "Rechercher des produits",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              // height: 100,
              child: ProductView(list: items),
            ),
          ],
        ),
      ),
    );

    /* return Scaffold(
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
          },
        ),
      ),
    ); */
  }
}
