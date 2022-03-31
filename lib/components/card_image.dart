import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  const CardImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
      child: Image.network(
        'imageUrl',
        height: 250,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, obj, stack) {
          return Image.asset(
            'assets/images/default.png',
            width: double.infinity,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
