import 'package:flurant/providers/dummy_data.dart';
import 'package:flurant/models/meal.dart';
import 'package:flutter/foundation.dart';

class MealsProvider with ChangeNotifier {
  List<Meal> _meals = DUMMY_MEALS;

  List<Meal> get meals => _meals;

  List<Meal> get favouriteMeals =>
      _meals.where((meal) => meal.isFavourite).toList();

  void add(Meal meal) {}

  void delete(Meal meal) {}

  List<Meal> mealsWith(String categoryId) {
    return meals.where((meal) => meal.categories.contains(categoryId)).toList();
  }
}
