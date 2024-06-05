// import 'dart:developer';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:rexparts/model/admin_product_model.dart';
// import 'package:rexparts/service/admin_service.dart';

// class ProductProvider with ChangeNotifier {
//   final FirebaseService firebaseService = FirebaseService();
//   final formKey = GlobalKey<FormState>();
//   final productNameController = TextEditingController();
//   final descriptionController = TextEditingController();
//   final priceController = TextEditingController();
//   Future<List<ProductModel>>? productList;
//   String? selectedCategory;
//   File? image;

//   final ImagePicker picker = ImagePicker();

//   Future<void> addProduct({
//     required String name,
//     required String category,
//     required String description,
//     required double price,
//     File? image,
//   }) async {
//     String imageUrl = '';
//     if (image != null) {
//       imageUrl = await firebaseService.uploadImage(image);
//     }

//     final product = ProductModel(
//       id: DateTime.now().millisecondsSinceEpoch.toString(),
//       name: name,
//       category: category,
//       description: description,
//       price: price,
//       imageUrl: imageUrl,
//     );

//     await firebaseService.addProduct(product);
//     notifyListeners();
//   }

//   Future<void> fetchProductList(String category) async {
//     try {
//       productList = firebaseService.getCategory(category);
//       notifyListeners();
//     } catch (error) {
//       log('category error');
//     }
//   }
// }

// import 'dart:developer';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:rexparts/model/admin_product_model.dart';
// import 'package:rexparts/service/admin_service.dart';

// class ProductProvider with ChangeNotifier {
//   final FirebaseService firebaseService = FirebaseService();
//   final formKey = GlobalKey<FormState>();
//   final productNameController = TextEditingController();
//   final descriptionController = TextEditingController();
//   final priceController = TextEditingController();
//   List<ProductModel> productList = [];

//   String? selectedCategory;
//   File? image;

//   final ImagePicker picker = ImagePicker();

//   Future<void> addProduct({
//     required String name,
//     required String category,
//     required String description,
//     required double price,
//     File? image,
//   }) async {
//     String imageUrl = '';
//     if (image != null) {
//       imageUrl = await firebaseService.uploadImage(image);
//     }

//     final product = ProductModel(
//       id: DateTime.now().millisecondsSinceEpoch.toString(),
//       name: name,
//       category: category,
//       description: description,
//       price: price,
//       imageUrl: imageUrl,
//     );

//     await firebaseService.addProduct(product);
//     notifyListeners();
//   }

//   Future<void> fetchProductList(String category) async {
//     try {
//       productList = await firebaseService.getCategory(category);
//       notifyListeners();
//     } catch (error) {
//       log('Error fetching product list: $error');
//       // Handle the error accordingly, such as showing a snackbar or retrying the operation
//     }
//   }
// }import 'dart:developer';

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rexparts/model/admin_product_model.dart';
import 'package:rexparts/service/admin_service.dart';

class ProductProvider with ChangeNotifier {
  final FirebaseService firebaseService = FirebaseService();
  final formKey = GlobalKey<FormState>();
  final productNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  List<ProductModel> productList = [];

  String? selectedCategory;
  File? image;

  final ImagePicker picker = ImagePicker();

  void setImage(File pickedImage) {
    image = pickedImage;
    notifyListeners();
  }

  Future<void> addProduct({
    required String name,
    required String category,
    required String description,
    required double price,
    File? image,
  }) async {
    try {
      String imageUrl = '';
      if (image != null) {
        imageUrl = await firebaseService.uploadImage(image);
      }

      final product = ProductModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        category: category,
        description: description,
        price: price,
        imageUrl: imageUrl,
      );

      await firebaseService.addProduct(product);
      notifyListeners();
    } catch (e) {
      log('Error adding product: $e');
    }
  }

  Future<void> fetchProductList(String category) async {
    try {
      productList = await firebaseService.getCategory(category);
      notifyListeners();
    } catch (error) {
      log('Error fetching product list: $error');
    }
  }
}
