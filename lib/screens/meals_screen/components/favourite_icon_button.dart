import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/meal.dart';
import '../../../providers/meals_provider.dart';

class FavouriteIconButton extends StatelessWidget {
  final Meal meal;
  const FavouriteIconButton({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _mealsProvider = Provider.of<MealsProvider>(context, listen: false);

    return InkWell(
      onTap: () => _mealsProvider.toggleFavourite(meal.id),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Icon(
          meal.isFavourite ? Icons.favorite : Icons.favorite_border,
          size: 32,
          color: Colors.red,
        ),
      ),
    );
  }
}
