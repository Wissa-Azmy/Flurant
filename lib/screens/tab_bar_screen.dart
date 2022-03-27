import 'package:flurant/screens/categories_screen.dart';
import 'package:flurant/screens/favorites_screen.dart';
import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int _selectedTabIndex = 0;
  final List<Widget> _screens = const [CategoriesScreen(), FavoritesScreen()];

  final List<BottomNavigationBarItem> _items = const [
    BottomNavigationBarItem(label: 'Categories', icon: Icon(Icons.category)),
    BottomNavigationBarItem(label: 'Favorites', icon: Icon(Icons.star))
  ];

  void _selectTap(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_items[_selectedTabIndex].label!)),
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        onTap: _selectTap,
        currentIndex: _selectedTabIndex,
      ),
      body: _screens[_selectedTabIndex],
    );
  }
}
