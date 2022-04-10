import 'package:flutter/foundation.dart';

import '../models/cart_item.dart';
import '../models/meal.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  List<CartItem> get items => _items.values.toList();

  void addItem(Meal product) {
    if (!isInStock(product)) return;

    if (_items.containsKey(product.id)) {
      increaseQuantity(product.id);
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
    final item =
        _items.entries.firstWhere((element) => element.key == productId).value;

    if (item.quantity == item.product.quantity) return;

    _items.update(
      productId,
      (item) => CartItem(product: item.product, quantity: item.quantity + 1),
    );

    notifyListeners();
  }

  bool isInStock(Meal product) {
    return product.quantity > 1;
  }

  void decreaseQuantity(String productId) {
    if (!_items.containsKey(productId)) return;
    final item =
        _items.entries.firstWhere((element) => element.key == productId).value;

    if (item.quantity == 1) return;

    _items.update(
      productId,
      (item) => CartItem(
        product: item.product,
        quantity: item.quantity - 1,
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
