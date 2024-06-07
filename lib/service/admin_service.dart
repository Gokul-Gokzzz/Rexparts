import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rexparts/model/admin_product_model.dart';

class FirebaseService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<List<ProductModel>> getAllProduct() async {
    try {
      final snapshot = await firestore.collection('product').get();

      List<ProductModel> data = snapshot.docs
          .map(
            (e) => ProductModel.fromJson(e),
          )
          .toList();
      log("jasdaks${data.length.toString()}");
      return data;
    } catch (e) {
      log(e.toString());
      log('for--m service');
      throw e;
    }
  }

  Future<String> uploadImage(File image) async {
    final storageRef = storage
        .ref()
        .child('product_images/${DateTime.now().millisecondsSinceEpoch}');
    final uploadTask = await storageRef.putFile(image);
    return await uploadTask.ref.getDownloadURL();
  }

  Future<void> addProduct(ProductModel product) async {
    await firestore.collection('product').doc(product.id).set(product.toJson());
  }

  Future<List<ProductModel>> getCategory(String category) async {
    try {
      final snapshot = await firestore
          .collection('product')
          .where('category', isEqualTo: category)
          .get();
      return snapshot.docs.map((doc) => ProductModel.fromJson(doc)).toList();
    } catch (error) {
      log('Error fetching category: $error');
      return [];
    }
  }

  Future<void> favListClicked(String id, bool status) async {
    try {
      if (status == true) {
        log('add to fav');
        await firestore.collection('product').doc(id).update(
          {
            'favorite': FieldValue.arrayUnion(
              [firebaseAuth.currentUser!.uid],
            )
          },
        );
      } else {
        log('add to faasdkf;askljkajv');
        await firestore.collection('product').doc(id).update(
          {
            'favorite': FieldValue.arrayRemove(
              [firebaseAuth.currentUser!.uid],
            )
          },
        );
      }
    } catch (e) {
      log("error is $e");
    }
  }
}
