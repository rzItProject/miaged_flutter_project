// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_app_project_miaged/data/providers/auth_provider.dart';
import 'package:flutter_app_project_miaged/data/providers/home_pages_provider.dart';
import 'package:flutter_app_project_miaged/screens/pages/profil_page.dart';
import 'package:flutter_app_project_miaged/screens/pages/purchase_page.dart';
import 'package:flutter_app_project_miaged/screens/pages/shopping_cart_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _selectedIndex = ref.watch(indexProvider);
    final List<Widget> _pages = [
      const PurchasePage(),
      const ShoppingCart(),
      const ProfilPage(),
    ];

    // int _selectedIndex = 1;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Riverpod'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                ref.read(authRepositoryProvider).signOut();
              },
            ),
          ],
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              indicatorColor: Colors.blue.shade100,
              labelTextStyle: MaterialStateProperty.all(const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ))),
          child: NavigationBar(
            // height: 70,
            backgroundColor: const Color(0xFFf1f5fb),
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            animationDuration: const Duration(seconds: 1),
            selectedIndex: _selectedIndex,
            onDestinationSelected: (index) {
              ref.read(indexProvider.notifier).state = index;
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.shopping_bag_outlined),
                selectedIcon: Icon(
                  Icons.shopping_bag,
                  color: Colors.white,
                ),
                label: 'Acheter',
              ),
              NavigationDestination(
                icon: Icon(Icons.shopping_cart_outlined),
                selectedIcon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                label: 'Panier',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_2_outlined),
                selectedIcon: Icon(
                  Icons.person_2,
                  color: Colors.white,
                ),
                label: 'Profil',
              ),
            ],
          ),
        ));
  }
}

/* body: Center(
        child: user.when(
          data: (data) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "Vous êtes connecté en tant que ${data?.displayName ?? data?.email}"),
                ElevatedButton(
                  onPressed: () {
                    ref.read(authRepositoryProvider).signOut();
                  },
                  child: const Text("Déconnexion"),
                ),
              ],
            );
          },
          error: (error, stackTrace) {
            return Text(error.toString());
          },
          loading: () => const CircularProgressIndicator(),
        ),
      ), */


/* bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GNav(
            selectedIndex: _selectedIndex,
            gap: 8,
            backgroundColor: Colors.white,
            color: Colors.black,
            // tabActiveBorder: Border.all(color: Colors.black, width: 1),
            activeColor: Colors.deepPurple,
            tabBackgroundColor: Colors.deepPurple.withOpacity(0.1),
            // padding: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            iconSize: 24,
            onTabChange: (index) {
              print(index);
            },
            tabs: const [
              GButton(
                icon: Icons.shopping_bag_outlined,
                text: 'Acheter',
              ),
              GButton(
                icon: Icons.shopping_cart_outlined,
                text: 'Panier',
              ),
              GButton(
                icon: Icons.person_2_outlined,
                text: 'Profil',
              ),
            ],
          ),
        ),
      ), */