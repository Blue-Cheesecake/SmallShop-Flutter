class CartItem {
  final String id;
  final String title;
  int quantity;
  final double price;
  final String imageUrl;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.imageUrl,
  });

  void addOneQuantity() {
    quantity += 1;
  }

  double get totalAmount => quantity * price;

  @override
  String toString() {
    return "$title: $quantity";
  }

  @override
  bool operator ==(Object other) {
    if (other is CartItem) {
      return other.title == title &&
          other.quantity == quantity &&
          other.price == price &&
          other.imageUrl == imageUrl;
    }
    return false;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => Object.hash(title, quantity, price, imageUrl);
}
