import 'package:flurant/models/product.dart';
import 'package:flutter/material.dart';

class CartItem with ChangeNotifier {
  final Product product;
  final int quantity;

  CartItem({required this.product, required this.quantity});
}
