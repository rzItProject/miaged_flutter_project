import 'package:flutter/material.dart';
import 'package:flutter_app_project_miaged/data/providers/cart_provider.dart';
import 'package:flutter_app_project_miaged/data/providers/home_pages_provider.dart';
import 'package:flutter_app_project_miaged/screens/profil_page.dart';
import 'package:flutter_app_project_miaged/screens/product_page.dart';
import 'package:flutter_app_project_miaged/screens/shopping_cart_page.dart';
import 'package:flutter_app_project_miaged/utils/color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(indexProvider);
    final items = ref.watch(cartStateProvider);
    final List<Widget> pages = [
      const ProductPage(),
      const ShoppingCartPage(),
      const ProfilPage(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        decoration: const BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        ),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.blue.shade100,
            labelTextStyle: MaterialStateProperty.all(
              const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          child: Stack(
            children: [
              NavigationBar(
                height: 60,
                backgroundColor: Colors.transparent,
                labelBehavior:
                    NavigationDestinationLabelBehavior.onlyShowSelected,
                animationDuration: const Duration(seconds: 1),
                selectedIndex: selectedIndex,
                onDestinationSelected: (index) {
                  ref.read(indexProvider.notifier).state = index;
                },
                destinations: const [
                  NavigationDestination(
                    icon:
                        Icon(Icons.shopping_bag, color: Colors.white, size: 35),
                    selectedIcon: Icon(
                      Icons.shopping_bag,
                      color: Colors.white,
                    ),
                    label: 'Acheter',
                  ),
                  NavigationDestination(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                      size: 35,
                    ),
                    selectedIcon: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    label: 'Panier',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.person_2, color: Colors.white, size: 35),
                    selectedIcon: Icon(
                      Icons.person_2,
                      color: Colors.white,
                    ),
                    label: 'Profil',
                  ),
                ],
              ),
              // pin pour indiquer le nombre d'article dans le panier
              if (selectedIndex != 1)
                Positioned(
                  right: MediaQuery.of(context).size.width * 0.42,
                  top: 8,
                  child: Container(
                    alignment: Alignment.center,
                    height: 15,
                    width: 15,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: kOrangeColor,
                    ),
                    child: Text('${items.length}',
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w500)),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
