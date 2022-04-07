import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'meals_screen/components/meal_item.dart';
import '../providers/meals_provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealsProvider = Provider.of<MealsProvider>(context);

    return ListView.builder(
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: mealsProvider.favouriteMeals[index],
        child: MealItem(key: ValueKey(mealsProvider.favouriteMeals[index].id)),
      ),
      itemCount: mealsProvider.favouriteMeals.length,
    );
  }
}
