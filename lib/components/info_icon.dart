import 'package:flutter/material.dart';

class InfoIcon extends StatelessWidget {
  const InfoIcon(
    this.infoIcon, {
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;
  final IconData infoIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(infoIcon),
        const SizedBox(width: 8),
        Text(text),
      ],
    );
  }
}
