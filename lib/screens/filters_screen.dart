import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget {
  static const String routeName = '/filters';

  const FiltersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: const Center(child: Text('Filters Screen')),
    );
  }
}
