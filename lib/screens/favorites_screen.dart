import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/meal_item.dart';
import '../providers/meals_provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favouriteMeals = Provider.of<MealsProvider>(context).favouriteMeals;

    return ListView.builder(
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: favouriteMeals[index],
        child: MealItem(),
      ),
      itemCount: favouriteMeals.length,
    );
  }
}
