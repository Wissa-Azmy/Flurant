import 'package:flurant/screens/cart_screen.dart';
import 'package:flurant/screens/categories_screen.dart';
import 'package:flurant/screens/favorites_screen.dart';
import 'package:flutter/material.dart';

import '../components/app drawer/app_drawer.dart';
import '../components/popup_menu.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int _selectedTabIndex = 0;
  final List<Widget> _screens = const [
    CategoriesScreen(),
    FavoritesScreen(),
    CartScreen()
  ];

  final List<BottomNavigationBarItem> _barItems = const [
    BottomNavigationBarItem(label: 'Categories', icon: Icon(Icons.category)),
    BottomNavigationBarItem(label: 'Favorites', icon: Icon(Icons.star)),
    BottomNavigationBarItem(label: 'Cart', icon: Icon(Icons.shopping_cart))
  ];

  void _selectTap(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_barItems[_selectedTabIndex].label!),
        actions: const [PopupMenu()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _barItems,
        onTap: _selectTap,
        currentIndex: _selectedTabIndex,
      ),
      body: _screens[_selectedTabIndex],
      drawer: const AppDrawer(),
    );
  }
}
