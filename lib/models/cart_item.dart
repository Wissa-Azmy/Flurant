import 'package:flurant/models/meal.dart';
import 'package:flutter/foundation.dart';

class CartItem {
  final Meal product;
  final int quantity;

  CartItem({required this.product, required this.quantity});
}

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  void addItem(Meal product, double price) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id,
        (item) => CartItem(product: item.product, quantity: item.quantity + 1),
      );
    } else {}
    notifyListeners();
  }
}
