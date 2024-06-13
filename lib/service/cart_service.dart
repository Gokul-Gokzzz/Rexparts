import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rexparts/model/cart_model.dart';

class CartService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  late CollectionReference<CartModel> cartProduct;

  CartService() {
    cartProduct = firestore.collection('cart').withConverter<CartModel>(
          fromFirestore: (snapshots, _) =>
              CartModel.fromJson(snapshots.data()!),
          toFirestore: (product, _) => product.toJson(),
        );
  }

  Future<void> deleteProduct(String id) async {
    try {
      await cartProduct.doc(id).delete();
    } catch (e) {
      throw Exception("Error deleting product: $e");
    }
  }

  Future<String> uploadImage(File image) async {
    try {
      final storageRef = storage
          .ref()
          .child('product_images/${DateTime.now().millisecondsSinceEpoch}');
      final uploadTask = await storageRef.putFile(image);
      return await uploadTask.ref.getDownloadURL();
    } catch (e) {
      throw Exception("Error uploading image: $e");
    }
  }

  Future<void> addProduct(CartModel cart, String id) async {
    try {
      await cartProduct.doc(id).set(cart);
    } catch (e) {
      throw Exception("Error adding product: $e");
    }
  }

  Future<List<CartModel>> getCart() async {
    try {
      final snapshot = await cartProduct.get();
      return snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      throw Exception("Error fetching cart: $e");
    }
  }
}
