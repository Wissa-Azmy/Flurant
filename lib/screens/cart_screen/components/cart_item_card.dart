import 'package:flurant/common/utils.dart';
import 'package:flurant/providers/cart_provider.dart';
import 'package:flurant/screens/cart_screen/components/popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/info_icon.dart';
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
              child: Column(
                children: [
                  ListTile(
                    title: FittedBox(
                      alignment: Alignment.centerLeft,
                      fit: BoxFit.scaleDown,
                      child: Text(
                        _item.product.title,
                        style: const TextStyle(fontSize: 32),
                      ),
                    ),
                    subtitle: const NumbersStepper(title: 'Quantity'),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InfoIcon(Icons.attach_money,
                            text: _item.product.retailPriceText),
                        InfoIcon(
                          Icons.numbers,
                          text: _item.quantity.toString(),
                        ),
                        InfoIcon(Icons.monetization_on,
                            text: '${_item.quantity * _item.product.retailPrice} LE'),
                      ],
                    ),
                  )
                ],
              ),
            ),
            confirmDismiss: (_) => Utils.confirmDeletion(context),
            onDismissed: (_) => _cartProvider.removeItem(_item.product.id),
          ),
        ),
        const Positioned(top: 0, right: 8, child: PopupMenu())
      ],
    );
  }
}
