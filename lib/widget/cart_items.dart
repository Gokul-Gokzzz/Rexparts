class CartItem {
  final String image;
  final double price;
  int quantity;

  CartItem({
    required this.image,
    required this.price,
    this.quantity = 1,
  });
}
