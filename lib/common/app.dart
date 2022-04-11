import 'package:flurant/screens/cart_screen/cart_screen.dart';
import 'package:flurant/screens/categories_screen.dart';
import 'package:flurant/screens/filters_screen.dart';
import 'package:flurant/screens/item_detail_screen.dart';
import 'package:flurant/screens/meals_screen/meals_screen.dart';
import 'package:flurant/screens/tab_bar_screen/tab_bar_screen.dart';
import 'package:flutter/material.dart';

class App {
  final BuildContext context;

  const App({Key? key, required this.context});

// MARK: - ThemeData
  static ThemeData get theme {
    return ThemeData(
      primarySwatch: Colors.blue,
      colorScheme: colorScheme,
      canvasColor: const Color.fromRGBO(255, 254, 229, 1),
      fontFamily: 'Raleway',
      textTheme: textTheme,
    );
  }

// MARK: - TextTheme
  static TextTheme get textTheme {
    return ThemeData.light().textTheme.copyWith(
        bodyMedium: const TextStyle(
          color: Color.fromRGBO(20, 51, 51, 1),
        ),
        bodyLarge: const TextStyle(
          color: Color.fromRGBO(20, 51, 51, 1),
        ),
        bodySmall: const TextStyle(
          fontSize: 14,
          color: Color.fromRGBO(20, 51, 51, 1),
        ),
        titleLarge: const TextStyle(
          color: Colors.black,
          fontSize: 28,
          fontFamily: 'RobotoCondensed',
        ),
        titleMedium: const TextStyle(
          fontSize: 22,
          fontFamily: 'RobotoCondensed',
        ),
        labelSmall: const TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ));
  }

// MARK: - ColorScheme
  static ColorScheme get colorScheme {
    return ThemeData.light().colorScheme.copyWith(secondary: Colors.amber);
  }

// MARK: - Routes
  static final Map<String, Widget Function(BuildContext)> routes = {
    '/': (conetxt) => const TabBarScreen(),
    MealsScreen.routeName: (context) => const MealsScreen(),
    ItemDetailScreen.routeName: (context) => const ItemDetailScreen(),
    FiltersScreen.routeName: (context) => const FiltersScreen(),
    CartScreen.routeName: (context) => CartScreen()
  };

  static final MaterialPageRoute defaultRoute = MaterialPageRoute(
    builder: (BuildContext context) => const CategoriesScreen(),
  );
}
