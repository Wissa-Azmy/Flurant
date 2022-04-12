import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../common/app.dart';
import '../../../models/order.dart';

class OrderCard extends StatefulWidget {
  const OrderCard({
    Key? key,
    required Order order,
  })  : _order = order,
        super(key: key);

  final Order _order;

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  bool _isExpanded = false;
  late Order order;

  @override
  void didChangeDependencies() {
    order = widget._order;
    super.didChangeDependencies();
  }

  void toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(widget._order.amount.toString()),
          subtitle: Text(
            DateFormat('dd/MM/yyyy hh:mm').format(widget._order.timeStamp),
          ),
          trailing: IconButton(
            icon: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
            onPressed: toggleExpanded,
          ),
        ),
        if (_isExpanded)
          Container(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
            height: min(order.items.length * 20 + 32, 200),
            child: ListView(
              children: order.items
                  .map(
                    (item) => Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item.product.title,
                            style: App.textTheme.titleSmall,
                          ),
                          Text('${item.quantity} x ${item.product.price}')
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
      ],
    );
  }
}
