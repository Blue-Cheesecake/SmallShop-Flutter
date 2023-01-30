import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:small_shop/models/cart_item.dart';
import 'package:small_shop/providers/cart_provider.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key? key, required this.cartItem}) : super(key: key);

  final CartItem cartItem;

  /// Show the warning dialog about proceeding to remove item
  ///
  /// Use Cupertino style
  void _showWarningDialog(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            "Alert",
            style: TextStyle(color: Theme.of(context).errorColor),
          ),
          content: Text("Do you actually want to remove this item?"),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              child: Text("No"),
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoDialogAction(
              child: Text("Yes"),
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(context);
                final CartProvider cartProvider = Provider.of<CartProvider>(
                  context,
                  listen: false,
                );
                cartProvider.removeOneFromItem(cartItem);
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartItem.id),
      onDismissed: (direction) {
        final CartProvider cartProvider = Provider.of<CartProvider>(
          context,
          listen: false,
        );
        cartProvider.removeItem(cartItem);
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: const Padding(
          padding: EdgeInsets.all(30.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(
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
            subtitle: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Price: ${cartItem.price}"),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Qty: "),

                    // Remove 1 item button
                    //
                    IconButton(
                      onPressed: () {
                        print(cartItem.quantity);
                        if (cartItem.quantity == 1) {
                          _showWarningDialog(context);
                          return;
                        }
                        final CartProvider cartProvider =
                            Provider.of<CartProvider>(
                          context,
                          listen: false,
                        );
                        cartProvider.removeOneFromItem(cartItem);
                      },
                      icon: const Icon(
                        Icons.remove,
                        size: 18,
                        color: Colors.blueAccent,
                      ),
                    ),

                    // Current Quantity
                    //
                    Text("${cartItem.quantity}"),

                    // Add 1 item button
                    //
                    IconButton(
                      onPressed: () {
                        final CartProvider cartProvider =
                            Provider.of<CartProvider>(
                          context,
                          listen: false,
                        );
                        cartProvider.addOneFromItem(cartItem);
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 18,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                )
              ],
            ),
            visualDensity: VisualDensity.comfortable,
            trailing: Text("\$${cartItem.totalAmount}"),
          ),
        ),
      ),
    );
  }
}
