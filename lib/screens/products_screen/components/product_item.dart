// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/product.dart';
import '../../item_detail_screen.dart';
import '../../../components/card_image.dart';
import '../../../components/card_title_strip.dart';
import '../../../components/info_icon.dart';
import 'cart_icon_button.dart';
import 'favourite_icon_button.dart';

class ProductItem extends StatelessWidget {
  ProductItem({Key? key}) : super(key: key);

  void selectItem(BuildContext context, Product meal) {
    Navigator.of(context).pushNamed(
      ItemDetailScreen.routeName,
      arguments: meal,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _product = Provider.of<Product>(context, listen: false);

    return InkWell(
      onTap: () => selectItem(context, _product),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Stack(
              children: [
                CardImage(imageUrl: _product.imageUrl),
                CardTitleStrip(title: _product.title),
                Consumer<Product>(
                  builder: (BuildContext context, meal, Widget? child) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FavouriteIconButton(product: meal),
                      CartIconButton(product: meal),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InfoIcon(Icons.schedule, text: '${_product.duration} min'),
                  Consumer<Product>(
                    builder: (__, meal, _) => InfoIcon(Icons.work, text: meal.quantity.toString()),
                  ),
                  InfoIcon(Icons.attach_money, text: _product.retailPrice.toString()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
