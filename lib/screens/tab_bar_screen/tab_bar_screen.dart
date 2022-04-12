import 'package:flurant/screens/categories_screen.dart';
import 'package:flurant/screens/favorites_screen.dart';
import 'package:flurant/screens/orders_screen/orders_screen.dart';
import 'package:flutter/material.dart';

import 'app drawer/app_drawer.dart';
import 'components/cart_button.dart';

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
    OrdersScreen()
  ];

  final List<BottomNavigationBarItem> _barItems = const [
    BottomNavigationBarItem(label: 'Categories', icon: Icon(Icons.category)),
    BottomNavigationBarItem(label: 'Favourites', icon: Icon(Icons.star)),
    BottomNavigationBarItem(label: 'Orders', icon: Icon(Icons.payment)),
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
        actions: const [CartButton(), SizedBox(width: 8)],
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
