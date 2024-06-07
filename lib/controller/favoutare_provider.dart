import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rexparts/model/admin_product_model.dart';
import 'package:rexparts/service/admin_service.dart';

class FavoutareProvider extends ChangeNotifier {
  FirebaseService productService = FirebaseService();

  Future<void> favouritesCliscked(String id, bool status) async {
    log('fvt controler');
    await productService.favListClicked(id, status);
    notifyListeners();
  }

  bool favouritesCheck(ProductModel product) {
    final currentuser = FirebaseAuth.instance.currentUser;
    final user = currentuser!.email ?? currentuser.phoneNumber;
    return !product.favorite!.contains(user);
  }
}
