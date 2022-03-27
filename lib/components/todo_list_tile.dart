import 'package:flutter/material.dart';

class ToDoListTile extends StatefulWidget {
  final dynamic item;
  const ToDoListTile({Key? key, required this.item}) : super(key: key);

  @override
  State<ToDoListTile> createState() => _ToDoListTileState();
}

class _ToDoListTileState extends State<ToDoListTile> {
  bool checkBoxState = false;

  void updateCheckBoxState(bool? newValue) {
    setState(() {
      checkBoxState = newValue ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final text = widget.item as String;

    return ListTile(
      key: ValueKey(text),
      title: Text(text),
      trailing: Checkbox(value: checkBoxState, onChanged: updateCheckBoxState),
    );
  }
}
