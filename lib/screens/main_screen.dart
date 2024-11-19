import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home/home_screen.dart';
import 'favorites/favorites_screen.dart';
import 'profile/profile_screen.dart';

class MainScreen extends StatelessWidget {
  final RxInt currentIndex = 0.obs;

  MainScreen({super.key});

  final screens = [
    const HomeScreen(),
    const FavoritesScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => screens[currentIndex.value]),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 65,
          selectedIndex: currentIndex.value,
          onDestinationSelected: (index) => currentIndex.value = index,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.sports_soccer_outlined),
              selectedIcon: Icon(Icons.sports_soccer_sharp),
              label: 'Team List',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_outline),
              selectedIcon: Icon(Icons.favorite),
              label: 'Favorite Team',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: 'My Profile',
            ),
          ],
        ),
      ),
    );
  }
} 