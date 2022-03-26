import 'package:flutter/material.dart';

import 'todo_list_tile.dart';

class SimpleList extends StatelessWidget {
  final List items;
  const SimpleList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: ((context, index) {
        return Column(
          children: [
            ToDoListTile(item: items[index]),
            const Divider(),
          ],
        );
      }),
      itemCount: items.length,
    );
  }
}
