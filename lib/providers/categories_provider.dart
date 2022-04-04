import 'package:flurant/providers/dummy_data.dart';
import 'package:flurant/models/category.dart';
import 'package:flutter/foundation.dart' hide Category;

class CategoriesProvider with ChangeNotifier {
  List<Category> _categories = DUMMY_CATEGORIES;

  List<Category> get categories => _categories;

  void add(Category category) {
    _categories.add(category);
    notifyListeners();
  }

  void delete(Category category) {
    _categories.remove(category);
    notifyListeners();
  }
}
