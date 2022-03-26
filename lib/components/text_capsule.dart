import 'package:flutter/material.dart';

import '../common/app.dart';

class TextCapsule extends StatelessWidget {
  final String text;

  const TextCapsule(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: App.textTheme.titleMedium,
      ),
    );
  }
}
