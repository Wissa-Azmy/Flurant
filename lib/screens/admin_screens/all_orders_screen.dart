import 'manage_categories/add_category_form.dart';
import 'package:flutter/material.dart';

class AllOrdersScreen extends StatelessWidget {
  static const String routeName = '/filters';

  const AllOrdersScreen({Key? key}) : super(key: key);

  void navigateToAddCategoryForm(BuildContext context) {
    Navigator.of(context).pushNamed(AddCategoryForm.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Orders'),
        actions: [
          IconButton(
            onPressed: () => navigateToAddCategoryForm(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: const Center(child: Text('No Orders added yet.')),
    );
  }
}
