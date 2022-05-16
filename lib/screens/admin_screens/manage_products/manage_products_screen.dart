import 'package:flurant/common/utils.dart';
import 'package:flurant/providers/meals_provider.dart';
import 'package:flurant/screens/admin_screens/manage_products/add_product_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/dismissible_delete_background.dart';


class ManageProductsScreen extends StatelessWidget {
  static const String routeName = '/allProducts';

  const ManageProductsScreen({Key? key}) : super(key: key);

  void navigateToAddProductForm(BuildContext context) {
    Navigator.of(context).pushNamed(AddProductForm.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<MealsProvider>(context);
    final products = productsProvider.meals;

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
        actions: [
          IconButton(
            onPressed: () => navigateToAddProductForm(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: products.isEmpty ? 
        const Center(child: Text('No Products added yet.'))
        : ListView.builder(
            itemCount: products.length,
            itemBuilder: (
              (context, index) => Card(
                margin: const EdgeInsets.all(8), 
                child: Dismissible(
                  key: ValueKey(products[index].id),
                  background: const DismissibleDeleteBackground(),
                  direction: DismissDirection.endToStart,
                  confirmDismiss: (_) => Utils.confirmDeletion(context),
                  onDismissed: (_) => productsProvider.delete(products[index]),
                  child: ListTile(
                    title: Text(products[index].title),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit), 
                      onPressed: () {},
                    ),
                    ),
                )
              )
            )
          ),
    );
  }
}
