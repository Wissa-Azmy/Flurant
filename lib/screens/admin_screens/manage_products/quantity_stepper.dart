import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/app.dart';
import '../../../models/meal.dart';
import '../../cart_screen/components/stepper_button.dart';

class QuantityStepper extends StatelessWidget {
  final String title;
  const QuantityStepper({Key? key, required this.title}) : super(key: key);

  Widget buildQuantityText(BuildContext context, Meal product, Widget? child) {
    return Text(
      product.quantity.toString(),
      style: App.textTheme.titleSmall,
    );
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Meal>(context, listen: false);

    return SizedBox(
      width: 100,
      height: 56,
      child: Row(
        children: [
          Text(title),
          const SizedBox(width: 8),
          StepperButton(
            icon: Icons.remove,
            tapHandler: () => product.decreaseQuantity(null),
          ),
          const SizedBox(width: 8),
          Consumer<Meal>(builder: buildQuantityText),
          const SizedBox(width: 8),
          StepperButton(
            icon: Icons.add,
            tapHandler: () => product.increaseQuantity(null),
          ),
        ],
      ),
    );
  }
}