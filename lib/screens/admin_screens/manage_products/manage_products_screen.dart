import 'package:flurant/providers/meals_provider.dart';
import 'package:flurant/screens/admin_screens/manage_products/add_product_form.dart';
import 'package:flurant/screens/admin_screens/manage_products/product_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


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
            itemBuilder:  (context, index) => ChangeNotifierProvider.value(
                value: products[index],
                child: ProductListTile(),
              ),
          ),
    );
  }
}
