import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/cart_provider.dart';
import '../../cart_screen/cart_screen.dart';
import '../../../components/badge.dart';

class CartButton extends StatelessWidget {
  const CartButton({Key? key}) : super(key: key);

  void showCartScreen(BuildContext context) {
    Navigator.of(context).pushNamed(CartScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (_, cartProvider, child) => AppBadge(
        child: child!,
        value: cartProvider.itemsCount.toString(),
      ),
      child: IconButton(
        icon: const Icon(Icons.shopping_cart),
        onPressed: () => showCartScreen(context),
      ),
    );
  }
}
