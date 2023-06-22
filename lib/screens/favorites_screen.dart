import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'products_screen/components/product_item.dart';
import '../providers/products_provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);

    return ListView.builder(
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: productsProvider.favouriteProducts[index],
        child: ProductItem(key: ValueKey(productsProvider.favouriteProducts[index].id)),
      ),
      itemCount: productsProvider.favouriteProducts.length,
    );
  }
}
