import 'package:flurant/providers/cart_provider.dart';
import 'package:flurant/screens/cart_screen/components/popup_menu.dart';
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

    return Stack(
      children: [
        Card(
          margin: const EdgeInsets.all(16),
          child: Dismissible(
            background: const DismissibleDeleteBackground(),
            direction: DismissDirection.endToStart,
            key: ValueKey(_item.product.id),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ListTile(
                leading: Chip(
                  label: Text(_item.product.priceText,
                      style: App.textTheme.bodySmall),
                ),
                title: FittedBox(child: Text(_item.product.title)),
                subtitle: const NumbersStepper(title: 'Quantity'),
              ),
            ),
            confirmDismiss: (_) {
              return showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text('Confirm Deletion'),
                  content: const Text('Are you sure to delete this item?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(ctx).pop(false),
                      child: const Text('No'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(ctx).pop(true),
                      child: const Text('Yes'),
                    )
                  ],
                ),
              );
            },
            onDismissed: (_) => _cartProvider.removeItem(_item.product.id),
          ),
        ),
        const Positioned(top: 0, right: 8, child: PopupMenu())
      ],
    );
  }
}
