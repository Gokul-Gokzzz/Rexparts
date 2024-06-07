class CartModel {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  int quantity;

  CartModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.quantity,
  });
  double get totalPrice => price * quantity;
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
      'quantity': quantity,
    };
  }

  factory CartModel.fromJson(Map<String, dynamic> data) {
    return CartModel(
      id: data['id'],
      name: data['name'],
      price: data['price'],
      imageUrl: data['imageUrl'],
      quantity: data['quantity'],
    );
  }
}
