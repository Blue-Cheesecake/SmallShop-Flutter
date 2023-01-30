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
            leading: Builder(
              builder: (context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).closeDrawer();
                  },
                  icon: Icon(
                    Icons.menu_open_outlined,
                    color: Theme.of(context).primaryColor,
                    size: 28,
                  ),
                );
              },
            ),
            title: Text(
              "Menus",
              style: Theme.of(context).textTheme.headline5,
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
          ),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.shop,
              color: Theme.of(context).primaryColor,
              size: 28,
            ),
            title: Text(
              "Shop",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(ProductOverViewScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.payment_rounded,
              color: Theme.of(context).primaryColor,
              size: 28,
            ),
            title: Text(
              "Orders",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
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
