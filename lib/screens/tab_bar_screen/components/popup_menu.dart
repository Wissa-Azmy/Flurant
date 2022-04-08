import 'package:flutter/material.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({
    Key? key,
  }) : super(key: key);

  void doNothing(Object? value) {}

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) => doNothing(value),
      itemBuilder: (_) => const [
        PopupMenuItem(
          child: Text('data'),
          value: 0,
        ),
        PopupMenuItem(
          child: Text('more date'),
          value: 1,
        ),
      ],
    );
  }
}
