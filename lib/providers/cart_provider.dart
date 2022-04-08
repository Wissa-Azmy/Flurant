import 'package:flutter/foundation.dart';

import '../models/cart_item.dart';
import '../models/meal.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  List<CartItem> get items => _items.values.toList();

  void addItem(Meal product) {
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

  void removeItem(String productId) {
    _items.removeWhere((key, value) => key == productId);

    notifyListeners();
  }

  void increaseQuantity(String productId) {
    if (!_items.containsKey(productId)) return;

    _items.update(
      productId,
      (item) => CartItem(product: item.product, quantity: item.quantity + 1),
    );

    notifyListeners();
  }

  void decreaseQuantity(String productId) {
    if (!_items.containsKey(productId)) return;

    _items.update(
      productId,
      (item) => CartItem(
        product: item.product,
        quantity: item.quantity > 1 ? item.quantity - 1 : 1,
      ),
    );

    notifyListeners();
  }

  int itemQuantity(String productId) {
    return _items[productId]?.quantity ?? 0;
  }

  bool isInCart(String productId) {
    return _items.containsKey(productId);
  }

  int get itemsCount {
    int total = 0;
    for (var item in items) {
      total += item.quantity;
    }

    return total;
  }

  double get totalAmount {
    double total = 0;
    for (var item in items) {
      total += item.quantity * item.product.price;
    }

    return total;
  }
}
