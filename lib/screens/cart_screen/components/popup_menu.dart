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
          child: Text('Add Discount'),
          value: 0,
        ),
        PopupMenuItem(
          child: Text('Add Over Charge'),
          value: 1,
        ),
      ],
    );
  }
}
