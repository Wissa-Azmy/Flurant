import 'package:flutter/material.dart';
import 'common/app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flurant',
      theme: App.theme,
      routes: App.routes,
      onUnknownRoute: (settings) => App.defaultRoute,
    );
  }
}
