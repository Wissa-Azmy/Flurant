import 'package:flurant/common/app.dart';
import 'package:flutter/material.dart';

class MealsScreen extends StatelessWidget {
  final String categoryName;

  const MealsScreen({Key? key, required this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: Center(
          child: Text(
        'Wissa',
        style: App.textTheme.titleMedium,
      )),
    );
  }
}
