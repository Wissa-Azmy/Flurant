import 'package:flurant/providers/cart_provider.dart';
import 'package:flurant/providers/categories_provider.dart';
import 'package:flurant/providers/meals_provider.dart';
import 'package:flurant/providers/orders_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'common/app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoriesProvider()),
        ChangeNotifierProvider(create: (_) => MealsProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => OrdersProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flurant',
        theme: App.theme,
        routes: App.routes,
        onUnknownRoute: (settings) => App.defaultRoute,
      ),
    );
  }
}
