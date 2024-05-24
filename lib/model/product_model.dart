class Product {
  final String imageUrl;
  final String name;
  final double price;
  bool isFavorite;

  Product({
    required this.imageUrl,
    required this.name,
    required this.price,
    this.isFavorite = false,
  });
}