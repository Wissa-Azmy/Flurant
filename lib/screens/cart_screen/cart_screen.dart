import 'package:flurant/common/app.dart';
import 'package:flurant/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/cart_item_card.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final _cartItems = Provider.of<CartProvider>(context).items;

    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Column(
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
                    child: Text(cartProvider.itemsCount.toString()),
                  ),
                  const SizedBox(width: 16),
                  Text('Total', style: App.textTheme.titleMedium),
                  const SizedBox(width: 16),
                  Chip(
                    label: Text(
                      '${cartProvider.totalAmount.toString()} LE',
                      style: App.textTheme.labelLarge,
                    ),
                  ),
                  const Spacer(),
                  TextButton(onPressed: () {}, child: const Text('Checkout'))
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => ChangeNotifierProvider.value(
                value: _cartItems[index],
                child: const CartItemCard(),
              ),
              itemCount: cartProvider.items.length,
            ),
          ),
        ],
      ),
    );
  }
}
