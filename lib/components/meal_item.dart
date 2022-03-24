import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/item_detail_screen.dart';
import 'card_image.dart';
import 'card_title_strip.dart';
import 'info_icon.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({Key? key, required this.meal}) : super(key: key);

  void selectItem(BuildContext context) {
    Navigator.of(context).pushNamed(
      ItemDetailScreen.routeName,
      arguments: meal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectItem(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Stack(
              children: [
                CardImage(imageUrl: meal.imageUrl),
                CardTitleStrip(title: meal.title),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InfoIcon(Icons.schedule, text: '${meal.duration} min'),
                  InfoIcon(Icons.work, text: meal.complexityText),
                  InfoIcon(Icons.attach_money, text: meal.affordabilityText),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
