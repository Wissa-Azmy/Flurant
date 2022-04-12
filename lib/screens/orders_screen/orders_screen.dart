import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/app.dart';
import '../../providers/orders_provider.dart';
import 'components/order_card.dart';

class OrdersScreen extends StatelessWidget {
  static const String routeName = '/orders';
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _ordersProvider = Provider.of<OrdersProvider>(context);
    final _orders = _ordersProvider.orders;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 5,
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  child: Text(_orders.length.toString()),
                ),
                const SizedBox(width: 16),
                Text('Total', style: App.textTheme.titleMedium),
                const SizedBox(width: 16),
                Chip(
                  label: Text(
                    '${_ordersProvider.totalAmount.toString()} LE',
                    style: App.textTheme.labelLarge,
                  ),
                ),
                const Spacer(),
                Chip(
                  label: Text(
                    '${_ordersProvider.netProfit.toString()} LE',
                    style: App.textTheme.labelLarge?.copyWith(
                      color: _ordersProvider.netProfit > 0
                          ? Colors.greenAccent
                          : Colors.red[400],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => Card(
              child: OrderCard(order: _orders[index]),
            ),
            itemCount: _orders.length,
          ),
        ),
      ],
    );
  }
}
