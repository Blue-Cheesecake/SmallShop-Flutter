import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:small_shop/constants/show_option.dart';
import 'package:small_shop/providers/product_provider.dart';
import 'package:small_shop/providers/products_provider.dart';
import 'package:small_shop/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    Key? key,
    required this.currOption,
  }) : super(key: key);

  final ShowOption currOption;

  @override
  Widget build(BuildContext context) {
    ProductsProvider productsProvider = Provider.of(context);
    final List<ProductProvider> products = currOption == ShowOption.all
        ? productsProvider.items
        : productsProvider.favoriteItems;

    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
          value: products[index],
          child: const ProductItem(),
        );
      },
    );
  }
}
