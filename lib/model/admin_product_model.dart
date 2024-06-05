class ProductModel {
  final String id;
  final String name;
  final String category;
  final String description;
  final double price;
  final String imageUrl;
  final int? quantity;
  bool favorite;

  ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.quantity,
    this.favorite = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'quantity': quantity,
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> data) {
    return ProductModel(
      id: data['id'],
      name: data['name'],
      category: data['category'],
      description: data['description'],
      price: data['price'],
      imageUrl: data['imageUrl'],
      quantity: data['quantity'],
    );
  }
}
