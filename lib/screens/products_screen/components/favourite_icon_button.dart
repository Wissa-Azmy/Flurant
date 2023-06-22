import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/product.dart';
import '../../../providers/products_provider.dart';

class FavouriteIconButton extends StatelessWidget {
  final Product product;
  const FavouriteIconButton({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _productsProvider = Provider.of<ProductsProvider>(context, listen: false);

    return InkWell(
      onTap: () => _productsProvider.toggleFavourite(product.id),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Icon(
          product.isFavourite ? Icons.favorite : Icons.favorite_border,
          size: 32,
          color: Colors.red,
        ),
      ),
    );
  }
}
