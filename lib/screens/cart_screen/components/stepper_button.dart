import 'package:flutter/material.dart';

class StepperButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback tapHandler;
  const StepperButton({Key? key, required this.icon, required this.tapHandler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: FloatingActionButton(
        heroTag: null,
        elevation: 2,
        onPressed: tapHandler,
        backgroundColor: Colors.white,
        child: Icon(icon, color: Colors.black),
      ),
    );
  }
}
