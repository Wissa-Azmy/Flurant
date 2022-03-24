import 'package:flutter/material.dart';

import '../common/app.dart';

class CardTitleStrip extends StatelessWidget {
  const CardTitleStrip({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        width: MediaQuery.of(context).size.width - 16,
        padding: const EdgeInsets.all(8),
        color: Colors.black54,
        child: Text(
          title,
          style: App.textTheme.titleLarge?.copyWith(color: Colors.white),
          softWrap: true,
        ),
      ),
    );
  }
}
