import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:small_shop/providers/product_provider.dart';
import 'package:small_shop/providers/products_provider.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  static const routeName = "/product-detail";

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context)?.settings.arguments as String;
    ProductProvider product = Provider.of<ProductsProvider>(
      context,
      listen: false,
    ).findById(id);

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
        title: Text(product.title),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.blue,
          ),
        ),
      ),
      body: SafeArea(
        child: Card(
          margin: const EdgeInsets.all(10),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  product.title,
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 20),
                Text(
                  product.description,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          product.toggleFavorite();
                        });
                      },
                      icon: Icon(
                        product.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 30,
                      ),
                    ),
                    Text(
                      "\$${product.price}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
