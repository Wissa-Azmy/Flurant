import 'package:flurant/models/order.dart';
import 'package:flutter/foundation.dart';

import '../models/cart_item.dart';

class OrdersProvider with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders => _orders;

  void addOrder(List<CartItem> products, amount) {
    _orders.add(Order(id: DateTime.now().toString(), products: products, stockPrice: stockPrice, ammount: ammount, netProfit: netProfit, timeStamp: timeStamp),)
  }
}
