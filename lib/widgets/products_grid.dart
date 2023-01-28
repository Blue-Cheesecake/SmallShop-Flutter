import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:small_shop/providers/products_provider.dart';
import 'package:small_shop/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductsProvider productsProvider = Provider.of(context);
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(10),
      itemCount: productsProvider.items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
          value: productsProvider.items[index],
          child: const ProductItem(),
        );
      },
    );
  }
}
