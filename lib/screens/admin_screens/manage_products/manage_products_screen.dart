import 'package:flurant/screens/admin_screens/manage_products/add_product_form.dart';
import 'package:flutter/material.dart';


class ManageProductsScreen extends StatelessWidget {
  static const String routeName = '/allProducts';

  const ManageProductsScreen({Key? key}) : super(key: key);

  void navigateToAddProductForm(BuildContext context) {
    Navigator.of(context).pushNamed(AddProductForm.routeName);
  }

  @override
  Widget build(BuildContext context) {
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
      body: const Center(child: Text('No Products added yet.')),
    );
  }
}
