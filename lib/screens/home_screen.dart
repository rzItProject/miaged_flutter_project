// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_app_project_miaged/data/providers/home_pages_provider.dart';
import 'package:flutter_app_project_miaged/screens/pages/profil_page.dart';
import 'package:flutter_app_project_miaged/screens/pages/product_page.dart';
import 'package:flutter_app_project_miaged/screens/pages/shopping_cart_page.dart';
import 'package:flutter_app_project_miaged/screens/pages/testProduct.dart';
import 'package:flutter_app_project_miaged/utils/color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(currentPageProvider.notifier).state;
    final pageController = PageController(initialPage: currentPage);
    final tabBarIcons = [
      FontAwesomeIcons.house,
      FontAwesomeIcons.cartShopping,
      FontAwesomeIcons.user,
    ];

    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) =>
                ref.read(currentPageProvider.notifier).state = index,
            children: const [
              TestProductPage(),
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
                  ...tabBarIcons.map((icon) => IconButton(
                        onPressed: () {
                          icon == FontAwesomeIcons.house
                              ? pageController.jumpToPage(0)
                              : pageController.jumpToPage(1);
                        },
                        icon: Icon(
                          icon,
                          color: Colors.white60,
                          size: 22,
                        ),
                      ))
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
