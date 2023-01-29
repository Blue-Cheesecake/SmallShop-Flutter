import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:small_shop/constants/show_option.dart';
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
            icon: const Icon(Icons.more_vert, color: Colors.blue),
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
