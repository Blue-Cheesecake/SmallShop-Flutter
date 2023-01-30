import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:small_shop/models/cart_item.dart';
import 'package:small_shop/providers/cart_provider.dart';
import 'package:small_shop/providers/orders_provider.dart';
import 'package:small_shop/widgets/cart_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    final List<CartItem> cartItems = cartProvider.listItems;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        bottom: const PreferredSize(
          preferredSize: Size(double.infinity, 0),
          child: Divider(
            height: 1,
            thickness: 0.5,
            color: Colors.grey,
          ),
        ),
        backgroundColor: const Color.fromARGB(100, 230, 230, 230),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: cartItems.length,
              itemBuilder: (context, index) =>
                  CartCard(cartItem: cartItems[index]),
            ),
            ListTile(
              title: Text(
                  "Total: \$${cartProvider.totalPrice.toStringAsFixed(2)}"),
              trailing: CupertinoButton.filled(
                child: const Text("Order"),
                onPressed: () {
                  Provider.of<OrdersProvider>(context, listen: false).addOrder(
                    cartItems,
                    cartProvider.totalPrice,
                    cartProvider,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
