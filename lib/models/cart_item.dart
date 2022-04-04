import 'package:flurant/models/meal.dart';
import 'package:flutter/material.dart';

class CartItem with ChangeNotifier {
  final Meal product;
  final int quantity;

  CartItem({required this.product, required this.quantity});
}
