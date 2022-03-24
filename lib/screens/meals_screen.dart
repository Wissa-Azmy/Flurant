import 'package:flurant/common/app.dart';
import 'package:flurant/models/category.dart';
import 'package:flutter/material.dart';

class MealsScreen extends StatelessWidget {
  static const String routeName = 'meals-screen';

  const MealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
          child: Text(
        'Wissa',
        style: App.textTheme.titleMedium,
      )),
    );
  }
}
