import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/product.dart';
import '../../../providers/cart_provider.dart';
import '../../../components/badge.dart';

class CartIconButton extends StatelessWidget {
  final Product product;
  const CartIconButton({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cartProvider = Provider.of<CartProvider>(context);

    return InkWell(
      onTap: () => _cartProvider.isInStock(product)
          ? _cartProvider.addItem(product)
          : showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text('Out of Stock'),
                content: const Text('No more items available.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(ctx).pop(false),
                    child: const Text('Ok'),
                  )
                ],
              ),
            ),
      child: Container(
        width: 70,
        height: 70,
        margin: const EdgeInsets.all(8.0),
        child: _cartProvider.itemQuantity(product.id) > 0
            ? AppBadge(
                value: _cartProvider.itemQuantity(product.id).toString(),
                child: Icon(
                  _cartProvider.isInCart(product.id)
                      ? Icons.shopping_cart
                      : Icons.shopping_cart_outlined,
                  size: 32,
                  color: Colors.blue,
                ),
              )
            : Icon(
                _cartProvider.isInCart(product.id)
                    ? Icons.shopping_cart
                    : Icons.shopping_cart_outlined,
                size: 32,
                color: _cartProvider.isInStock(product) ? Colors.blue : Colors.grey,
              ),
      ),
    );
  }
}
