import 'package:flurant/screens/meals_screen/components/meal_item.dart';
import 'package:flurant/models/category.dart';
import 'package:flurant/providers/meals_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealsScreen extends StatelessWidget {
  static const String routeName = 'meals-screen';

  const MealsScreen({Key? key}) : super(key: key);

  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;
    final categoryMeals =
        Provider.of<MealsProvider>(context).mealsWith(category.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView.builder(
          itemBuilder: (context, index) => ChangeNotifierProvider.value(
            value: categoryMeals[index],
            child: MealItem(),
          ),
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
