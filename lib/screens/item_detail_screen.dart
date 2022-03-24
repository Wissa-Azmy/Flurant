import 'package:flurant/common/app.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';

class ItemDetailScreen extends StatelessWidget {
  static const String routeName = '/itemDetail';

  const ItemDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          meal.title,
          style: App.textTheme.titleLarge,
        ),
      ),
    );
  }
}
