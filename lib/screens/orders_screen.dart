import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders_provider.dart';

class OrdersScreen extends StatelessWidget {
  static const String routeName = '/orders';
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _orders = Provider.of<OrdersProvider>(context).orders;

    return ListView.builder(
      itemBuilder: (context, index) => Text('Cart is Empty'),
      itemCount: _orders.length,
    );
  }
}
