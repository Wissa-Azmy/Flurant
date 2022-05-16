import 'package:flurant/providers/categories_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_category_form.dart';

class ManageCategoriesScreen extends StatelessWidget {
  static const String routeName = '/manageCategories';

  const ManageCategoriesScreen({Key? key}) : super(key: key);

  void navigateToAddCategoryForm(BuildContext context) {
    Navigator.of(context).pushNamed(AddCategoryForm.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<CategoriesProvider>(context).categories;
    
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
      body: categories.isEmpty ? 
        const Center(child: Text('No Categories added yet.')) : 
        ListView(
          padding: const EdgeInsets.all(8),
          children: categories.reversed
          .map(
            (category) => Column(
              key: ValueKey(category.id),
              children: [
                ListTile(
                  title: Text(category.title), 
                  tileColor: category.color,
                  trailing: IconButton(
                    icon: const Icon(Icons.edit, color: Colors.white,), 
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 8,)
              ],
            ),
          )
          .toList(),
        )
    );
  }
}