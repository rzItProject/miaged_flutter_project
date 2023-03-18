import 'package:flutter/material.dart';
import 'package:flutter_app_project_miaged/utils/data.dart';
import 'package:flutter_app_project_miaged/data/providers/database_provider.dart';
import 'package:flutter_app_project_miaged/widgets/product_display.dart';
import 'package:flutter_app_project_miaged/widgets/top_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductPage extends ConsumerStatefulWidget {
  const ProductPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductPageSate();
}

class _ProductPageSate extends ConsumerState<ProductPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedValue = 0;

  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: categories.length, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final itemsStream = ref.watch(itemsStreamProvider);
    final allItems = itemsStream.value ?? [];
    final category = ref.watch(categoryProvider);
    final itemsByCategory = ref.watch(itemsByCategoryProvider(category));

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
        child: Column(
          children: <Widget>[
            const TopContainer(
              title: 'MIAGED',
              searchBarTitle: "Rechercher des produits",
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: TabBar(
                controller: tabController,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.black54,
                onTap: (index) {
                  ref.read(categoryProvider.notifier).state =
                      categories[index].category;
                },
                tabs: [
                  Tab(text: categories[0].category.toUpperCase()),
                  Tab(text: categories[1].category.toUpperCase()),
                  Tab(text: categories[2].category.toUpperCase()),
                  Tab(text: categories[3].category.toUpperCase()),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: itemsByCategory.when(
                data: (items) {
                  // print(category);
                  // print(items.length);
                  if (category == 'tous') return ProductView(list: allItems);
                  return ProductView(list: items);
                },
                loading: () => const CircularProgressIndicator(),
                error: (err, stackTrace) => Text('Error: $err'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
