import 'package:small_shop/models/cart_item.dart';

class Order {
  final String id;
  final double amount;
  final List<CartItem> products;
  DateTime? dateTime;

  Order({
    required this.id,
    required this.amount,
    required this.products,
    this.dateTime,
  });
}
