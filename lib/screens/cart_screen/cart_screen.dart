import 'package:flurant/common/app.dart';
import 'package:flurant/providers/cart_provider.dart';
import 'package:flurant/screens/cart_screen/components/popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/cart_item.dart';
import '../../providers/orders_provider.dart';
import 'components/cart_item_card.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';
  // ignore: prefer_const_constructors_in_immutables
  CartScreen({Key? key}) : super(key: key);

  late final CartProvider _cartProvider;
  bool _latePropertyIsNotInitialized = true;

  void checkout(BuildContext context, List<CartItem> items, double amount) {
    final _ordersProvider = Provider.of<OrdersProvider>(context, listen: false);
    final order = _ordersProvider.addOrder(items, amount);
    _cartProvider.emptyCart();
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    scaffoldMessenger.hideCurrentSnackBar();
    scaffoldMessenger.showSnackBar(
      SnackBar(
        content: const Text('Order added succefully!'),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            _ordersProvider.remove(order); 
            _cartProvider.addItems(items);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_latePropertyIsNotInitialized) {
      _cartProvider = Provider.of<CartProvider>(context);
      _latePropertyIsNotInitialized = false;
    }
    final _cartItems = _cartProvider.items;

    return Scaffold(
      appBar: AppBar(title: const Text('Cart'), actions: const [PopupMenu()]),
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
                    child: Text(_cartProvider.itemsCount.toString()),
                  ),
                  const SizedBox(width: 16),
                  Text('Total', style: App.textTheme.titleMedium),
                  const SizedBox(width: 16),
                  Chip(
                    label: Text(
                      '${_cartProvider.totalAmount.toString()} LE',
                      style: App.textTheme.labelLarge,
                    ),
                  ),
                  const Spacer(),
                  OutlinedButton(
                    child: const Text('Checkout'),
                    onPressed: _cartItems.isEmpty
                        ? null
                        : () => confirmCheckout(context, _cartItems),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => ChangeNotifierProvider.value(
                value: _cartItems[index],
                child: CartItemCard(),
              ),
              itemCount: _cartProvider.items.length,
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> confirmCheckout(BuildContext context, List<CartItem> _cartItems) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Confirm Checkout'),
        content: const Text('Are you sure to checkout?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              checkout(context, _cartItems, _cartProvider.totalAmount);
              Navigator.of(ctx).pop();
            },
            child: const Text('Yes'),
          )
        ],
      ),
    );
  }
}
