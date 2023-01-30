import 'package:flutter/foundation.dart';
import 'package:small_shop/models/cart_item.dart';
import 'package:small_shop/models/order.dart';

class OrdersProvider with ChangeNotifier {
  final _orders = <Order>[];

  List<Order> get orderItems => [..._orders];

  void addOrder(List<CartItem> cartProducts, double amount) {
    _orders.add(
      Order(
        id: (DateTime.now().second.toInt() + _orders.length).toString(),
        amount: amount,
        products: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
