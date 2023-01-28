import 'package:flutter/material.dart';
import 'package:small_shop/screens/product_detail/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  final String id;
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            ProductDetailScreen.routeName,
            arguments: id,
          );
        },
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite),
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
