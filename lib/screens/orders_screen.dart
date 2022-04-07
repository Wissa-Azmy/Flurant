import 'package:flurant/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static const String routeName = '/orders';
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<CartProvider>(context).items;

    return ListView.builder(
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: cartItems[index],
        child: const Text('Cart is Empty'),
      ),
      itemCount: cartItems.length,
    );
  }
}
