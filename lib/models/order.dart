import 'cart_item.dart';

class Order {
  final String id;
  final List<CartItem> items;
  final double amount;
  final DateTime timeStamp;

  Order(
      {required this.id,
      required this.items,
      required this.amount,
      required this.timeStamp});

  int get quantity {
    int quantity = 0;
    for (var item in items) {
      quantity += item.quantity;
    }

    return quantity;
  }

  double get stockPrice {
    double stockPrice = 0;
    for (var item in items) {
      stockPrice += item.product.price * item.quantity;
    }
    return stockPrice;
  }

  double get retailPrice {
    double retailPrice = 0;
    for (var item in items) {
      retailPrice += item.quantity * item.product.retailPrice;
    }
    return retailPrice;
  }

  double get netProfit {
    return retailPrice - stockPrice;
  }
}
