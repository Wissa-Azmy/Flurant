import 'package:flutter/material.dart';

class DismissibleDeleteBackground extends StatelessWidget {
  const DismissibleDeleteBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        child: Row(
          children: const [
            Spacer(),
            Icon(Icons.delete_forever, color: Colors.white, size: 32),
            SizedBox(width: 32)
          ],
        ));
  }
}
