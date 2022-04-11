import 'package:flurant/models/order.dart';
import 'package:flutter/foundation.dart';

import '../models/cart_item.dart';

class OrdersProvider with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders => _orders;

  void addOrder(List<CartItem> items, double amount) {
    if (items.isEmpty) return;

    _orders.add(Order(
        id: DateTime.now().toString(),
        items: items,
        amount: amount,
        timeStamp: DateTime.now()));

    notifyListeners();
  }

  void remove(Order order) {
    _orders.remove(order);
    notifyListeners();
  }
}
