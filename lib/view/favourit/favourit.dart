import 'package:flutter/material.dart';
import 'package:rexparts/widget/favourits_widget.dart';

class FavouritesPage extends StatelessWidget {
  final List<Map<String, String>> favouriteItems = [
    {'name': 'Product 1', 'price': '799/-'},
    {'name': 'Product 2', 'price': '899/-'},
    {'name': 'Product 3', 'price': '999/-'},
    {'name': 'Product 5', 'price': '1099/-'},
    {'name': 'Product 6', 'price': '1099/-'},
    {'name': 'Product 7', 'price': '1099/-'},
    {'name': 'Product 8', 'price': '1099/-'},
    {'name': 'Product 9', 'price': '1099/-'},
    {'name': 'Product 10', 'price': '1099/-'},
  ];

  FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favourites'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: favouriteItems.length,
        itemBuilder: (context, index) {
          return FavouriteItem(
            name: favouriteItems[index]['name']!,
            price: favouriteItems[index]['price']!,
          );
        },
      ),
    );
  }
}
