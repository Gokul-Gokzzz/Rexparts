import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:rexparts/model/cart_model.dart';
import 'package:rexparts/service/cart_service.dart';

class CartProvider extends ChangeNotifier {
  final CartService cartService = CartService();

  List<CartModel> cartItems = [];

  Future<void> addCart(CartModel cart, String id) async {
    try {
      await cartService.addProduct(cart, id);
      await fetchCart();
    } catch (error) {
      log("Error adding to cart: $error");
    }
  }

  Future<void> removeFromCart(String id) async {
    try {
      await CartService().deleteProduct(id);
      notifyListeners();
      await fetchCart();
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
