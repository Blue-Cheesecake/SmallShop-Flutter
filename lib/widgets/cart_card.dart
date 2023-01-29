import 'package:flutter/material.dart';
import 'package:small_shop/models/cart_item.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key? key, required this.cartItem}) : super(key: key);

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      color: Colors.white,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: SizedBox(
            width: 80,
            child: Image.network(
              cartItem.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(cartItem.title),
          subtitle: Text("Quantity: ${cartItem.quantity}"),
          visualDensity: VisualDensity.comfortable,
          trailing: Text("${cartItem.totalAmount}"),
        ),
      ),
    );
  }
}
