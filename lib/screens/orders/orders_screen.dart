import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:small_shop/providers/orders_provider.dart';
import 'package:small_shop/widgets/app_drawer.dart';
import 'package:small_shop/widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  static const routeName = "/orders";

  @override
  Widget build(BuildContext context) {
    final OrdersProvider ordersProvider = Provider.of<OrdersProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu_open_outlined,
                color: Theme.of(context).primaryColor,
                size: 28,
              ),
            );
          },
        ),
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
      ),
      body: SafeArea(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: ordersProvider.orderItems.length,
          itemBuilder: (_, i) => OrderItem(order: ordersProvider.orderItems[i]),
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}
