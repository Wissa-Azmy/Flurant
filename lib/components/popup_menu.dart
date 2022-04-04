import 'package:flutter/material.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) => print(value),
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
