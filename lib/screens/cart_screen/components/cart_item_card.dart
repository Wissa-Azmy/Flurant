import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/app.dart';
import '../../../models/cart_item.dart';
import 'numbers_stepper.dart';

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
          subtitle: const NumbersStepper(title: 'Quantity'),
          // trailing: const NumbersStepper(),
        ),
      ),
    );
  }
}
