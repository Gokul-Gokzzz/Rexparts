import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rexparts/model/admin_product_model.dart';

class FirebaseService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  FirebaseService() {
    categoryProduct =
        firestore.collection('products').withConverter<ProductModel>(
              fromFirestore: (snapshots, _) =>
                  ProductModel.fromJson(snapshots.data()!),
              toFirestore: (product, _) => product.toJson(),
            );
  }

  late CollectionReference<ProductModel> categoryProduct;

  Future<String> uploadImage(File image) async {
    final storageRef = storage
        .ref()
        .child('product_images/${DateTime.now().millisecondsSinceEpoch}');
    final uploadTask = await storageRef.putFile(image);
    return await uploadTask.ref.getDownloadURL();
  }

  Future<void> addProduct(ProductModel product) async {
    await categoryProduct.add(product);
  }

  Future<List<ProductModel>> getCategory(String category) async {
    try {
      final snapshot =
          await categoryProduct.where('category', isEqualTo: category).get();
      return snapshot.docs.map((doc) => doc.data()).toList();
    } catch (error) {
      log('Error fetching category: $error');
      return [];
    }
  }
}
