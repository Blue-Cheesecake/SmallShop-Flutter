import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:small_shop/providers/orders_provider.dart';
import 'package:small_shop/widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  static const routeName = "/orders";

  @override
  Widget build(BuildContext context) {
    final OrdersProvider ordersProvider = Provider.of<OrdersProvider>(context);

    return Scaffold(
      appBar: AppBar(
        bottom: const PreferredSize(
          preferredSize: Size(double.infinity, 0),
          child: Divider(
            height: 1,
            thickness: 0.5,
            color: Colors.grey,
          ),
        ),
        backgroundColor: const Color.fromARGB(100, 230, 230, 230),
        title: const Text("Orders"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.blue,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: ordersProvider.orderItems.length,
          itemBuilder: (_, i) => OrderItem(order: ordersProvider.orderItems[i]),
        ),
      ),
    );
  }
}
