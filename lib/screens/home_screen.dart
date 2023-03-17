// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_app_project_miaged/screens/pages/profil_page.dart';
import 'package:flutter_app_project_miaged/screens/pages/product_page.dart';
import 'package:flutter_app_project_miaged/screens/pages/shopping_cart_page.dart';
import 'package:flutter_app_project_miaged/services/current_home_page_notifier.dart';
import 'package:flutter_app_project_miaged/utils/color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final currentPage = ref.watch(currentPageProvider.notifier).state;
    // final pageController = PageController(initialPage: currentPage);
    final currentPage = ref.watch(currentPageProvider);
    final tabBarIcons = [
      FontAwesomeIcons.house,
      FontAwesomeIcons.cartShopping,
      FontAwesomeIcons.user,
    ];

    /* return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Navigator(
                    key: Navigation.nestedNavigation,
                    initialRoute: "/product",
                    onGenerateRoute: (RouteSettings settings) {
                      switch (settings.name) {
                        case '/product':
                          return MaterialPageRoute(
                              builder: (_) => const ProductPage());
                        case '/cart':
                          return MaterialPageRoute(
                              builder: (_) => const ShoppingCartPage());
                        case '/profil':
                          return MaterialPageRoute(
                              builder: (_) => const ProfilPage());
                        default:
                          return MaterialPageRoute(builder: (_) => Container());
                      }
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 10,
              left: 20,
              right: 20,
              child: Container(
                alignment: Alignment.center,
                height: 70,
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...tabBarIcons.asMap().entries.map(
                      (entry) {
                        final index = entry.key;
                        final icon = entry.value;
                        return IconButton(
                          onPressed: () {
                            ref
                                .read(currentPageProvider.notifier)
                                .setPage(index);
                            if (icon == FontAwesomeIcons.house) {
                              Navigation.nestedNavigation.currentState!
                                  .popAndPushNamed('/product');
                            } else if (icon == FontAwesomeIcons.cartShopping) {
                              Navigation.nestedNavigation.currentState!
                                  .pushNamedAndRemoveUntil(
                                      "/cart", (route) => false);
                            } else if (icon == FontAwesomeIcons.user) {
                              Navigation.nestedNavigation.currentState!
                                  .popAndPushNamed("/profil");
                            }
                          },
                          icon: Icon(
                            icon,
                            color: currentPage == index
                                ? Colors.white
                                : Colors.white60,
                            size: 22,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ); */

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            /* PageView(
              controller: pageController,
              onPageChanged: (index) =>
                  ref.read(currentPageProvider.notifier).state = index,
              children: const [
                // TestProductPage(),
                ProductPage(),
                ShoppingCartPage(),
                ProfilPage(),
              ],
            ), */
            IndexedStack(
              index: currentPage,
              children: const [
                // TestProductPage(),
                ProductPage(),
                ShoppingCartPage(),
                ProfilPage(),
              ],
            ),
            Positioned(
              bottom: 10,
              left: 20,
              right: 20,
              child: Container(
                alignment: Alignment.center,
                height: 70,
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...tabBarIcons.asMap().entries.map(
                      (entry) {
                        final index = entry.key;
                        final icon = entry.value;
                        return IconButton(
                          onPressed: () {
                            ref
                                .read(currentPageProvider.notifier)
                                .setPage(index);
                          },
                          icon: Icon(
                            icon,
                            color: currentPage == index
                                ? Colors.white
                                : Colors.white60,
                            size: 22,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
