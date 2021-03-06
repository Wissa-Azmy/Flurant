import 'package:flurant/common/utils.dart';
import 'package:flurant/components/dismissible_delete_background.dart';
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
    final categoriesProvider = Provider.of<CategoriesProvider>(context);
    final categories = categoriesProvider.categories;
    
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
            (category) => Card(
              margin: const EdgeInsets.all(8),
              child:
                Dismissible(
                  key: ValueKey(category.id),
                  background: const DismissibleDeleteBackground(),
                  direction: DismissDirection.endToStart,
                  confirmDismiss: (_) => Utils.confirmDeletion(context),
                  onDismissed: (_) => categoriesProvider.delete(category),
                  child: ListTile(
                    title: Text(category.title), 
                    tileColor: category.color,
                    trailing: IconButton(
                      icon: const Icon(Icons.edit, color: Colors.white,), 
                      onPressed: () {},
                    ),
                  ),
                ),
            ),
          )
          .toList(),
        )
    );
  }
}