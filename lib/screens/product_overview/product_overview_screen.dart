import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:small_shop/constants/show_option.dart';
import 'package:small_shop/providers/cart_provider.dart';
import 'package:small_shop/screens/cart/cart_screen.dart';
import 'package:small_shop/widgets/badge.dart';
import 'package:small_shop/widgets/products_grid.dart';

class ProductOverViewScreen extends StatefulWidget {
  const ProductOverViewScreen({Key? key}) : super(key: key);

  static const routeName = "/product-overview";

  @override
  State<ProductOverViewScreen> createState() => _ProductOverViewScreenState();
}

class _ProductOverViewScreenState extends State<ProductOverViewScreen> {
  ShowOption _currShowOption = ShowOption.all;

  @override
  Widget build(BuildContext context) {
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
        title: const Text("Small Shop"),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            initialValue: _currShowOption,
            onSelected: (value) {
              setState(() {
                _currShowOption = value;
              });
            },
            position: PopupMenuPosition.under,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              side: BorderSide(color: Color.fromARGB(100, 200, 200, 200)),
            ),
            icon: const Icon(
              Icons.settings,
              color: Colors.blue,
            ),
            itemBuilder: (context) => <PopupMenuEntry>[
              const PopupMenuItem(
                value: ShowOption.onlyFavorites,
                child: Text("Only Favorites"),
              ),
              const PopupMenuItem(
                value: ShowOption.all,
                child: Text("Show All"),
              ),
            ],
          ),
          Consumer<CartProvider>(
            builder: (context, value, c) => Badge(
              value: value.totalItems.toString(),
              child: c!,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: Icon(
                Icons.shopping_bag,
                size: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: ProductsGrid(
          currOption: _currShowOption,
        ),
      ),
    );
  }
}
