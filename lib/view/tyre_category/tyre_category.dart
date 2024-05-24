// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:rexparts/model/product_model.dart';
import 'package:rexparts/view/tyre_details/tyre_details.dart';
import 'package:rexparts/widget/tyre_card.dart';

class TyreScreen extends StatefulWidget {
  const TyreScreen({super.key});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<TyreScreen> {
  List<Product> products = [
    Product(
      imageUrl: 'assets/tyre.png',
      name: 'Product 1',
      price: 29.99,
    ),
    Product(
      imageUrl: 'assets/tyre.png',
      name: 'Product 2',
      price: 49.99,
    ),
    Product(
      imageUrl: 'assets/tyre.png',
      name: 'Product 2',
      price: 49.99,
    ),
    Product(
      imageUrl: 'assets/tyre.png',
      name: 'Product 2',
      price: 49.99,
    ),
    Product(
      imageUrl: 'assets/tyre.png',
      name: 'Product 2',
      price: 49.99,
    ),
    Product(
      imageUrl: 'assets/tyre.png',
      name: 'Product 2',
      price: 49.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              'Tyre',
              style: TextStyle(fontSize: 25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                label: const Text('Search.....'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TireDetailPage(),
                      ),
                    );
                  },
                  child: ProductCard(
                    product: products[index],
                    onFavoriteToggle: () {
                      setState(() {
                        products[index].isFavorite =
                            !products[index].isFavorite;
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
