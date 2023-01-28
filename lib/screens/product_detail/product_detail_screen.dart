import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:small_shop/providers/product_provider.dart';
import 'package:small_shop/providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  static const routeName = "/product-detail";

  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context)?.settings.arguments as String;
    ProductProvider product = Provider.of<ProductsProvider>(
      context,
      listen: false,
    ).findById(id);

    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text(product.title),
      ),
      body: Container(),
    );
  }
}
