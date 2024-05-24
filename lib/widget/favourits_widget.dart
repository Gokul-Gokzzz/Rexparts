import 'package:flutter/material.dart';

class FavouriteItem extends StatelessWidget {
  final String name;
  final String price;

  const FavouriteItem({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: Container(
            width: 50,
            height: 50,
            color: Colors.black,
          ),
          title: Text(name),
          subtitle: Text(price),
          trailing: const Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
