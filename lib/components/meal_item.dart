// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/meal.dart';
import '../screens/item_detail_screen.dart';
import 'card_image.dart';
import 'card_title_strip.dart';
import 'info_icon.dart';

class MealItem extends StatelessWidget {
  MealItem({Key? key}) : super(key: key);

  void selectItem(BuildContext context, Meal meal) {
    Navigator.of(context).pushNamed(
      ItemDetailScreen.routeName,
      arguments: meal,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _meal = Provider.of<Meal>(context, listen: false);

    return InkWell(
      onTap: () => selectItem(context, _meal),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Stack(
              children: [
                CardImage(imageUrl: _meal.imageUrl),
                CardTitleStrip(title: _meal.title),
                Consumer<Meal>(
                  builder: (BuildContext context, meal, Widget? child) {
                    return InkWell(
                      onTap: meal.toggleFavourite,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          meal.isFavourite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 32,
                          color: Colors.red,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InfoIcon(Icons.schedule, text: '${_meal.duration} min'),
                  InfoIcon(Icons.work, text: _meal.complexityText),
                  InfoIcon(Icons.attach_money, text: _meal.affordabilityText),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
