import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:small_shop/widgets/products_grid.dart';

class ProductOverViewScreen extends StatelessWidget {
  ProductOverViewScreen({Key? key}) : super(key: key);

  static const routeName = "/product-overview";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Small Shop"),
      ),
      body: SafeArea(
        child: const ProductsGrid(),
      ),
    );
  }
}
