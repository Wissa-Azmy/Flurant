import 'package:flurant/common/app.dart';
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
          subtitle: const NumbersStepper(title: 'Quantity'),
          // trailing: const NumbersStepper(),
        ),
      ),
    );
  }
}

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

class StepperButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback tapHandler;
  const StepperButton({Key? key, required this.icon, required this.tapHandler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: FloatingActionButton(
        heroTag: null,
        elevation: 2,
        onPressed: tapHandler,
        backgroundColor: Colors.white,
        child: Icon(icon, color: Colors.black),
      ),
    );
  }
}
