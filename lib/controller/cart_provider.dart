import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:rexparts/model/cart_model.dart';
import 'package:rexparts/service/cart_service.dart';

class CartProvider extends ChangeNotifier {
  final CartService cartService = CartService();

  List<CartModel> cartItems = [];

  Future<void> addCart(CartModel cart) async {
    try {
      await cartService.addProduct(cart);
      await fetchCart();
    } catch (error) {
      log("Error adding to cart: $error");
    }
  }

  Future<void> removeFromCart(String id) async {
    try {
      await cartService.deleteProduct(id);
      cartItems.removeWhere((item) => item.id == id);
      log("Removed item with id: $id from cart");
      await fetchCart(); // Ensure the cart is fetched again to update the UI correctly
    } catch (e) {
      log("Error removing from cart: $e");
    }
  }

  Future<void> fetchCart() async {
    try {
      cartItems = await cartService.getCart();
      notifyListeners();
    } catch (e) {
      log("Error fetching cart: $e");
    }
  }

  double get subtotal {
    return cartItems.fold(0, (total, current) => total + current.totalPrice);
  }
}
