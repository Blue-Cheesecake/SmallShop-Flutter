import 'package:flutter/foundation.dart';
import 'package:small_shop/models/cart_item.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};
  var _totalItems = 0;

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get totalItems => _totalItems;

  void addItem(String productId, double price, String title) {
    _totalItems += 1;
    if (_items.containsKey(productId)) {
      _items.update(productId, (c) {
        c.addOneQuantity();
        return c;
      });
      print(_items);
      notifyListeners();
      return;
    }

    _items.putIfAbsent(
      productId,
          () =>
          CartItem(
            id: DateTime.now().toString(),
            title: title,
            quantity: 1,
            price: price,
          ),
    );
    print(_items);
    notifyListeners();
  }
}
