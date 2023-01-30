import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:small_shop/models/cart_item.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};
  int _totalItems = 0;
  double _totalPrice = 0.0;

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get totalItems => _totalItems;

  double get totalPrice => _totalPrice;

  /// Return the list items that sorted by initial added date
  ///
  /// Add first, display first
  List<CartItem> get listItems {
    List<CartItem> result = List.of(_items.values);
    result.sort((a, b) => a.addedAt.second - b.addedAt.second);
    return result;
  }

  void removeItem(CartItem cartItem) {
    _items.removeWhere((key, value) => value.id == cartItem.id);
    _totalItems -= cartItem.quantity;
    _totalPrice -= cartItem.totalAmount;
    notifyListeners();
  }

  /// Remove only one item
  ///
  /// If the quantity is not enough, alert by returning [false]
  /// return [true] if successfully remove only one item
  bool removeOneFromItem(CartItem cartItem) {
    var isFound = false;
    CartItem? rmThis;
    _items.forEach((_, value) {
      if (value == cartItem) {
        value.quantity -= 1;
        _totalItems -= 1;
        _totalPrice -= cartItem.price;
        isFound = true;

        if (value.quantity == 0) {
          rmThis = value;
        }
        return;
      }
    });

    if (rmThis != null) {
      _items.removeWhere((key, value) => value == rmThis);
    }

    notifyListeners();
    return isFound;
  }

  bool addOneFromItem(CartItem cartItem) {
    var isFound = false;
    _items.forEach((key, value) {
      if (value == cartItem) {
        value.quantity += 1;
        _totalItems += 1;
        _totalPrice += cartItem.price;
        isFound = true;
      }
    });

    notifyListeners();
    return isFound;
  }

  void addItem(BuildContext context,
      String productId,
      double price,
      String title,
      String imageUrl,) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          "Added",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .secondary,
        duration: const Duration(milliseconds: 1500),
      ),
    );

    // Add price
    _totalPrice += price;

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
            imageUrl: imageUrl,
            addedAt: DateTime.now(),
          ),
    );
    print(_items);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  void removeItemByPId(String productId) {
    _items.remove(productId);
    notifyListeners();
  }
}
