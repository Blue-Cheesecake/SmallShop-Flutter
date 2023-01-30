import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:small_shop/models/order.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ListTile(
              title: Text("${order.amount}"),
              subtitle: Text(DateFormat.yMMMd().format(order.dateTime!)),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.expand_more),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
