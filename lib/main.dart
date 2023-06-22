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
      providers: App.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: App.name,
        theme: App.theme,
        routes: App.routes,
        onUnknownRoute: (settings) => App.defaultRoute,
      ),
    );
  }
}
