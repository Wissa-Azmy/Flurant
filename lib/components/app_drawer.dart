import 'package:flurant/common/app.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            color: App.theme.primaryColor,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            alignment: Alignment.bottomLeft,
            child: Text('Hidden Area!', style: App.textTheme.titleLarge),
          )
        ],
      ),
    );
  }
}
