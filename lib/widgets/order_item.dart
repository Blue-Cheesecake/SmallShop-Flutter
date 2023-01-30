import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:small_shop/models/cart_item.dart';
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
            ExpandablePanel(
              theme: const ExpandableThemeData(useInkWell: false),
              header: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\$${order.amount.toStringAsFixed(2)}",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    DateFormat.yMEd().format(order.dateTime!),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              collapsed: const SizedBox.shrink(),
              expanded: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: order.products.length,
                  itemBuilder: (context, index) {
                    CartItem item = order.products[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.title,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text(
                          "${item.quantity}x \$${item.price}",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
