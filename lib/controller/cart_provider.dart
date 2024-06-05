import 'package:flutter/material.dart';
import 'package:rexparts/widget/cart_items.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> cartItems = [];

  void addToCart(CartItem item) {
    cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(CartItem item) {
    cartItems.remove(item);
    notifyListeners();
  }
}
