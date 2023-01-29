import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:small_shop/providers/cart_provider.dart';
import 'package:small_shop/providers/product_provider.dart';
import 'package:small_shop/screens/product_detail/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductProvider productProvider =
        Provider.of<ProductProvider>(context);

    final CartProvider cartProvider = Provider.of<CartProvider>(context);

    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            ProductDetailScreen.routeName,
            arguments: productProvider.id,
          );
        },
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: Consumer<ProductProvider>(
              builder: (_, value, __) => IconButton(
                splashColor: Colors.transparent,
                onPressed: productProvider.toggleFavorite,
                icon: Icon(
                  productProvider.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                ),
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            title: Text(
              productProvider.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                cartProvider.addItem(
                  context,
                  productProvider.id,
                  productProvider.price,
                  productProvider.title,
                  productProvider.imageUrl,
                );
              },
              icon: const Icon(Icons.add_shopping_cart),
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          child: Image.network(
            productProvider.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
