import 'package:flutter/material.dart';

import '../components/simple_list.dart';
import '../components/text_capsule.dart';
import '../models/meal.dart';

class ItemDetailScreen extends StatelessWidget {
  static const String routeName = '/itemDetail';

  const ItemDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.asset(
                'assets/images/default.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            const TextCapsule('Ingrediants'),
            Container(
                height: 300,
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SimpleList(items: meal.ingredients)),
            const TextCapsule('Steps'),
            Container(
              height: 300,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SimpleList(items: meal.steps),
            )
          ],
        ),
      ),
    );
  }
}
