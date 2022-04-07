import 'package:flurant/common/app.dart';
import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  const Badge({
    Key? key,
    required this.child,
    required this.value,
    this.color,
  }) : super(key: key);

  final Widget child;
  final String value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 4,
          top: 8,
          child: Container(
            padding: const EdgeInsets.only(bottom: 3.0, left: 3),
            child: CircleAvatar(
              radius: 10,
              backgroundColor: color ?? App.colorScheme.secondary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FittedBox(
                      child: Text(value, style: App.textTheme.labelSmall)),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
