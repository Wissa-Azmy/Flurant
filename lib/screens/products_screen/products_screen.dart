import 'package:flurant/screens/products_screen/components/product_item.dart';
import 'package:flurant/models/category.dart';
import 'package:flurant/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  static const String routeName = 'meals-screen';

  const ProductsScreen({Key? key}) : super(key: key);

  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;
    final productsWithCategory =
        Provider.of<ProductsProvider>(context).productsWith(category.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView.builder(
          itemBuilder: (context, index) => ChangeNotifierProvider.value(
            value: productsWithCategory[index],
            child: ProductItem(),
          ),
          itemCount: productsWithCategory.length,
        ),
      ),
    );
  }
}
