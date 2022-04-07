import 'package:flutter/foundation.dart';

import '../models/cart_item.dart';
import '../models/meal.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

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
        quantity: item.quantity > 0 ? item.quantity - 1 : 0,
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
    items.forEach((key, value) {
      total += value.quantity;
    });

    return total;
  }

  double get totalAmount {
    double total = 0;
    items.forEach((key, value) {
      total += value.quantity * value.product.price;
    });

    return total;
  }
}
