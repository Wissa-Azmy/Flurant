import 'package:flurant/screens/categories_screen.dart';
import 'package:flurant/screens/meals_screen.dart';
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
          titleMedium: const TextStyle(
            fontSize: 22,
            fontFamily: 'RobotoCondensed',
          ),
        );
  }

// MARK: - ColorScheme
  static ColorScheme get colorScheme {
    return ThemeData.light().colorScheme.copyWith(secondary: Colors.amber);
  }

// MARK: - Routes
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (conetxt) => const CategoriesScreen(),
    MealsScreen.routeName: ((context) => const MealsScreen())
  };
}
