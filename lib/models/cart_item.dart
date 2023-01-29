class CartItem {
  final String id;
  final String title;
  int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });

  void addOneQuantity() {
    quantity += 1;
  }

  @override
  String toString() {
    return "$title: $quantity";
  }
}
