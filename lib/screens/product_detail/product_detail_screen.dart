import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  static const routeName = "/product-detail";

  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('title'),
      ),
      body: Container(),
    );
  }
}
