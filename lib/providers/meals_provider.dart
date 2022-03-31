import 'package:flurant/providers/dummy_data.dart';
import 'package:flurant/models/meal.dart';
import 'package:flutter/material.dart';

class MealsProvider with ChangeNotifier {
  List<Meal> _meals = DUMMY_MEALS;

  List<Meal> get meals => _meals;

  void add(Meal meal) {}

  void favourite(String mealId) {
    _meals.firstWhere((meal) => meal.id == mealId).isFavourite = true;
    notifyListeners();
  }

  void delete(Meal meal) {}
}
