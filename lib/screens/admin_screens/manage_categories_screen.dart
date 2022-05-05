import 'package:flutter/material.dart';

import '../categories_screen/add_category_form.dart';

class ManageCategoriesScreen extends StatelessWidget {
  static const String routeName = '/manageCategories';

  const ManageCategoriesScreen({Key? key}) : super(key: key);

  void navigateToAddCategoryForm(BuildContext context) {
    Navigator.of(context).pushNamed(AddCategoryForm.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Categories'),
        actions: [
          IconButton(
            onPressed: () => navigateToAddCategoryForm(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: const Center(child: Text('No Categories added yet.')),
    );
  }
}