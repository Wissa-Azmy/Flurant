import 'package:flurant/common/utils.dart';
import 'package:flurant/providers/products_provider.dart';
import 'package:flurant/screens/admin_screens/manage_products/quantity_stepper.dart';
import 'package:flurant/screens/cart_screen/components/popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/info_icon.dart';
import '../../../components/dismissible_delete_background.dart';
import '../../../models/product.dart';


class ProductListTile extends StatelessWidget {
  const ProductListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final mealsProvider = Provider.of<ProductsProvider>(context, listen: false);

    return Stack(
      children: [
        Card(
          margin: const EdgeInsets.all(8),
          child: Dismissible(
            background: const DismissibleDeleteBackground(),
            direction: DismissDirection.endToStart,
            key: ValueKey(product.id),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  ListTile(
                    title: FittedBox(
                      alignment: Alignment.centerLeft,
                      fit: BoxFit.scaleDown,
                      child: Text(
                        product.title,
                        style: const TextStyle(fontSize: 32),
                      ),
                    ),
                    subtitle: const QuantityStepper(title: 'Quantity'),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InfoIcon(Icons.attach_money, text: product.price.toString()),
                        InfoIcon(Icons.numbers, text: product.quantity.toString()),
                        InfoIcon(Icons.monetization_on, text: '${product.retailPrice} LE'),
                      ],
                    ),
                  )
                ],
              ),
            ),
            confirmDismiss: (_) => Utils.confirmDeletion(context),
            onDismissed: (_) => mealsProvider.delete(product),
          ),
        ),
        const Positioned(top: 0, right: 8, child: PopupMenu())
      ],
    );
  }
}