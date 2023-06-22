import 'package:flurant/common/app.dart';
import 'package:flurant/models/category.dart';
import 'package:flurant/screens/products_screen/products_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({Key? key, required this.category}) : super(key: key);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(ProductsScreen.routeName, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [category.color.withOpacity(0.7), category.color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          category.title,
          style: App.textTheme.titleMedium,
        ),
      ),
    );
  }
}
