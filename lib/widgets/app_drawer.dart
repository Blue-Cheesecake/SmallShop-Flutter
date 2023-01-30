import 'package:flutter/material.dart';
import 'package:small_shop/screens/orders/orders_screen.dart';
import 'package:small_shop/screens/product_overview/product_overview_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      child: ListView(
        children: [
          AppBar(
            title: Text("Menus"),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text("Shop"),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(ProductOverViewScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.payment_rounded),
            title: Text("Orders"),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
