import 'dart:math';

import 'package:flurant/models/category.dart';
import 'package:flurant/providers/categories_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCategoryForm extends StatefulWidget {
  static const String routeName = '/add_category_form';

  const AddCategoryForm({Key? key}) : super(key: key);

  @override
  State<AddCategoryForm> createState() => _AddCategoryFormState();
}

class _AddCategoryFormState extends State<AddCategoryForm> {
  final _priceNode = FocusNode();
  final _descriptionNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  Map<String, String> _formValues = {};

  void submit() {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) return;

    _formKey.currentState?.save();

    Color _randomColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];

    final category = Category(
        id: DateTime.now().toString(),
        title: _formValues['title'] ?? '',
        color: _randomColor);

    final categoriesProvider = Provider.of<CategoriesProvider>(context, listen: false);
    categoriesProvider.add(category);
  }

  String? validateTitle(String? value) {
    if (value!.isEmpty || value.length < 5) {
      return 'Enter a valid title.';
    }
    return null;
  }

  String? validatePrice(String? value) {
    if (value!.isEmpty) {
      return 'Enter a valid Price.';
    }
    return null;
  }

  @override
  void dispose() {
    _priceNode.dispose();
    _descriptionNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _focusScope = FocusScope.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Add Category')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Title'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) => _focusScope.requestFocus(_priceNode),
                  validator: validateTitle,
                  onSaved: (value) =>
                      _formValues.putIfAbsent('title', () => value ?? ''),
                ),
                TextFormField(
                    decoration: const InputDecoration(labelText: 'Price'),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    focusNode: _priceNode,
                    onFieldSubmitted: (_) =>
                        _focusScope.requestFocus(_descriptionNode),
                    validator: validatePrice,
                    onSaved: (value) =>
                        _formValues.putIfAbsent('price', () => value ?? '')),
                TextFormField(
                    decoration: const InputDecoration(labelText: 'Description'),
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    focusNode: _descriptionNode,
                    onSaved: (value) => _formValues.putIfAbsent(
                        'description', () => value ?? '')),
                OutlinedButton(onPressed: submit, child: const Text('Submit'))
              ],
            )),
      ),
    );
  }
}
