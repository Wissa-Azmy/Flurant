import 'package:flurant/providers/dummy_data.dart';
import 'package:flurant/models/product.dart';
import 'package:flutter/foundation.dart';

class ProductsProvider with ChangeNotifier {
  final List<Product> _products = DUMMY_PRODUCTS;

  List<Product> get products => _products;

  List<Product> get favouriteProducts =>
      _products.where((product) => product.isFavourite).toList();

  void add(Product product) {}

  void delete(Product product) {}

  List<Product> productsWith(String categoryId) => products
      .where((product) => product.categories.contains(categoryId))
      .toList();

  void toggleFavourite(String productId) {
    _products
        .where((product) => product.id == productId)
        .first
        .toggleFavourite();

    notifyListeners();
  }
}
