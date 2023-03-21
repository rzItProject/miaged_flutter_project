// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_app_project_miaged/screens/profil_page.dart';
import 'package:flutter_app_project_miaged/screens/product_page.dart';
import 'package:flutter_app_project_miaged/screens/shopping_cart_page.dart';
import 'package:flutter_app_project_miaged/services/current_home_page_notifier.dart';
import 'package:flutter_app_project_miaged/utils/color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(currentPageProvider);
    final tabBarIcons = [
      FontAwesomeIcons.house,
      FontAwesomeIcons.cartShopping,
      FontAwesomeIcons.user,
    ];

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            IndexedStack(
              index: currentPage,
              children: const [
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
