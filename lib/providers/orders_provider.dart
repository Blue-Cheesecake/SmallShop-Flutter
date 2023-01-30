import 'package:flutter/foundation.dart';
import 'package:small_shop/models/cart_item.dart';
import 'package:small_shop/models/order.dart';
import 'package:small_shop/providers/cart_provider.dart';

class OrdersProvider with ChangeNotifier {
  final _orders = <Order>[];

  List<Order> get orderItems => [..._orders];

  void addOrder(
      List<CartItem> cartProducts, double amount, CartProvider cartProvider) {
    _orders.add(
      Order(
        id: (DateTime.now().second.toInt() + _orders.length).toString(),
        amount: amount,
        products: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
    cartProvider.clear();
    notifyListeners();
  }
}
