import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:rexparts/controller/admin_controller.dart';
import 'package:rexparts/view/Admin/receiver_chat.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  Future<void> pickImage() async {
    final proProvider = Provider.of<ProductProvider>(context, listen: false);
    final pickedFile =
        await proProvider.picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      proProvider.setImage(File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: productProvider.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: pickImage,
                  child: Consumer<ProductProvider>(
                    builder: (context, productProvider, child) {
                      return productProvider.image == null
                          ? Container(
                              height: 100,
                              width: 100,
                              color: Colors.grey[200],
                              child: Icon(Icons.camera_alt),
                            )
                          : Image.file(productProvider.image!,
                              height: 100, width: 100, fit: BoxFit.cover);
                    },
                  ),
                ),
                TextFormField(
                  controller: productProvider.productNameController,
                  decoration: InputDecoration(labelText: 'Product Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter product name';
                    }
                    return null;
                  },
                ),
                Consumer<ProductProvider>(
                  builder: (context, prd, child) =>
                      DropdownButtonFormField<String>(
                    value: prd.selectedCategory,
                    decoration: InputDecoration(labelText: 'Category'),
                    items: [
                      'Tyre',
                      'Oil and Fluid',
                      'Break System',
                      'Damping',
                      'Engine',
                      'Clutch / Parts'
                    ]
                        .map((category) => DropdownMenuItem(
                              value: category,
                              child: Text(category),
                            ))
                        .toList(),
                    onChanged: (value) {
                      prd.selectedCategory = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a category';
                      }
                      return null;
                    },
                  ),
                ),
                TextFormField(
                  controller: productProvider.descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter description';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: productProvider.priceController,
                  decoration: InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter price';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (productProvider.formKey.currentState!.validate()) {
                      Provider.of<ProductProvider>(context, listen: false)
                          .addProduct(
                        name: productProvider.productNameController.text,
                        category: productProvider.selectedCategory!,
                        description: productProvider.descriptionController.text,
                        price:
                            double.parse(productProvider.priceController.text),
                        image: productProvider.image,
                      );
                    }
                  },
                  child: Text('Submit'),
                ),
                SizedBox(
                  height: 150,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'You Have a Message',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReceiverChat(),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 20,
                        child: Lottie.asset('assets/chat.json'),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
