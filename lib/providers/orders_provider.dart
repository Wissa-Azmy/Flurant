import 'package:flurant/models/order.dart';
import 'package:flutter/foundation.dart';

import '../models/cart_item.dart';

class OrdersProvider with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders => _orders;

  Order addOrder(List<CartItem> items, double amount) {
    items.forEach((element) {element.product.decreaseQuantity(element.quantity);});

    final order = Order(
        id: DateTime.now().toString(),
        items: items,
        amount: amount,
        timeStamp: DateTime.now());

    _orders.add(order);

    notifyListeners();
    return order;
  }

  double get totalAmount {
    double total = 0;
    for (var order in _orders) {
      total += order.amount;
    }
    return total;
  }

  double get netProfit {
    double total = 0;
    for (var order in _orders) {
      total += order.netProfit;
    }
    return total;
  }

  void remove(Order order) {
    order.items.forEach((element) {element.product.increaseQuantity(element.quantity);});
    
    _orders.remove(order);
    notifyListeners();
  }
}
