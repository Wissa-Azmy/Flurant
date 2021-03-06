import 'package:flutter/foundation.dart';

enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}

enum Brand { apple, samsung, sony }

class Meal with ChangeNotifier {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final double price;
  final double retailPrice;
  // final Brand brand;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  int quantity;
  bool isFavourite;

  Meal(
      {required this.id,
      required this.categories,
      required this.title,
      required this.imageUrl,
      required this.ingredients,
      required this.steps,
      required this.duration,
      required this.price,
      required this.retailPrice,
      required this.complexity,
      required this.affordability,
      required this.isGlutenFree,
      required this.isVegan,
      required this.isVegetarian,
      required this.isLactoseFree,
      this.quantity = 0,
      this.isFavourite = false});

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.challenging:
        return 'Challenging';
      case Complexity.hard:
        return 'Hard';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.pricey:
        return 'Pricey';
      case Affordability.luxurious:
        return 'Luxurious';
    }
  }

  String get retailPriceText => '${retailPrice.toString()} LE';

  void toggleFavourite() {
    isFavourite = !isFavourite;

    notifyListeners();
  }

  void increaseQuantity(int? returnedQuantity) {
    quantity += returnedQuantity ?? 1;

    notifyListeners();
  }

  void decreaseQuantity(int? soldQuantity) {
    if (quantity - (soldQuantity ?? 1) >= 0) {
      quantity -= soldQuantity ?? 1;
      
      notifyListeners();
    }
  }
}
