import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/cart_provider.dart';
import 'badge.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (_, cartProvider, child) => Badge(
        child: IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
        value: cartProvider.itemsCount.toString(),
      ),
    );
  }
}
