import 'package:flurant/common/app.dart';
import 'package:flutter/material.dart';

class DrawerLink extends StatelessWidget {
  final String title;
  final IconData? icon;
  final VoidCallback tapHandler;

  const DrawerLink(
      {Key? key, required this.title, this.icon, required this.tapHandler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 30),
      title: Text(title, style: App.textTheme.titleMedium),
      onTap: tapHandler,
    );
  }
}
