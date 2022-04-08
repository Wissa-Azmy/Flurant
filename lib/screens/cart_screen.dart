import 'package:flurant/common/app.dart';
import 'package:flurant/components/text_capsule.dart';
import 'package:flurant/models/cart_item.dart';
import 'package:flurant/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

class CartItemCard extends StatelessWidget {
  const CartItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _item = Provider.of<CartItem>(context);

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          leading: Chip(
            label:
                Text(_item.product.priceText, style: App.textTheme.bodySmall),
          ),
          title: FittedBox(child: Text(_item.product.title)),
        ),
      ),
    );
  }
}
