import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/app.dart';
import '../../../models/cart_item.dart';
import '../../../providers/cart_provider.dart';

class NumbersStepper extends StatelessWidget {
  final String title;
  const NumbersStepper({Key? key, required this.title}) : super(key: key);

  Widget buildQuantityText(BuildContext context, CartItem item, Widget? child) {
    return Text(
      item.quantity.toString(),
      style: App.textTheme.titleSmall,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _item = Provider.of<CartItem>(context, listen: false);
    final _cartProvider = Provider.of<CartProvider>(context, listen: false);

    return SizedBox(
      width: 100,
      height: 56,
      child: Row(children: [
        Text(title),
        const SizedBox(width: 8),
        StepperButton(
          icon: Icons.remove,
          tapHandler: () => _cartProvider.decreaseQuantity(_item.product.id),
        ),
        const SizedBox(width: 8),
        Consumer<CartItem>(builder: buildQuantityText),
        const SizedBox(width: 8),
        StepperButton(
          icon: Icons.add,
          tapHandler: () => _cartProvider.increaseQuantity(_item.product.id),
        ),
      ]),
    );
  }
}
