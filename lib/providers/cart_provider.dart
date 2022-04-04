import 'package:flutter/foundation.dart';

import '../models/cart_item.dart';
import '../models/meal.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  void addItem(Meal product, double price) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id,
        (item) => CartItem(product: item.product, quantity: item.quantity + 1),
      );
    } else {
      _items.putIfAbsent(
          product.id, () => CartItem(product: product, quantity: 1));
    }
    notifyListeners();
  }
}
