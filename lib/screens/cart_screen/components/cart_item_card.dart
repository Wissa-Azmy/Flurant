import 'package:flurant/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/app.dart';
import '../../../models/cart_item.dart';
import '../../../components/dismissible_delete_background.dart';
import 'numbers_stepper.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _item = Provider.of<CartItem>(context);
    final _cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Card(
      margin: const EdgeInsets.all(16),
      child: Dismissible(
        background: const DismissibleDeleteBackground(),
        direction: DismissDirection.endToStart,
        key: ValueKey(_item.product.id),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: Chip(
              label:
                  Text(_item.product.priceText, style: App.textTheme.bodySmall),
            ),
            title: FittedBox(child: Text(_item.product.title)),
            subtitle: const NumbersStepper(title: 'Quantity'),
            // trailing: const NumbersStepper(),
          ),
        ),
        onDismissed: (_) => _cartProvider.removeItem(_item.product.id),
      ),
    );
  }
}