import 'package:flutter/foundation.dart';

import '../models/cart_item.dart';
import '../models/meal.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  List<CartItem> get items => _items.values.toList();

  void addItem(Meal product) {
    if (!isInStock(product)) return;

    if (isInCart(product.id)) {
      increaseQuantity(product.id);
    } else {
      addToCart(product);
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.removeWhere((key, value) => key == productId);

    notifyListeners();
  }

  void addToCart(Meal product) {
    _items.putIfAbsent(
      product.id,
      () => CartItem(product: product, quantity: 1),
    );
  }

  void increaseQuantity(String productId) {
    if (!isInCart(productId)) return;
    final item =
        _items.entries.firstWhere((element) => element.key == productId).value;

    if (item.quantity == item.product.quantity) return;

    _items.update(
      productId,
      (item) => CartItem(product: item.product, quantity: item.quantity + 1),
    );

    notifyListeners();
  }

  bool isInCart(String productId) {
    return _items.containsKey(productId);
  }

  bool isInStock(Meal product) {
    return product.quantity > 1 && itemQuantity(product.id) < product.quantity;
  }

  void decreaseQuantity(String productId) {
    if (!isInCart(productId)) return;
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
      total += item.quantity * item.product.retailPrice;
    }

    return total;
  }

  void emptyCart() {
    if (_items.isEmpty) return;

    _items = {};
    notifyListeners();
  }
}
