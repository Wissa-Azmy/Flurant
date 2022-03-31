import 'package:flurant/components/meal_item.dart';
import 'package:flurant/models/category.dart';
import 'package:flurant/providers/meals_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealsScreen extends StatelessWidget {
  static const String routeName = 'meals-screen';

  const MealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;
    final categoryMeals = Provider.of<MealsProvider>(context)
        .meals
        .where((element) => element.categories.contains(category.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => MealItem(meal: categoryMeals[index]),
        itemCount: categoryMeals.length,
      ),
    );
  }
}
