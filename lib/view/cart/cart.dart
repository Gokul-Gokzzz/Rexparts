// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:rexparts/widget/cart_items.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> cartItems = [
    CartItem(image: 'assets/tyre.png', price: 29.99, quantity: 1),
    CartItem(image: 'assets/tyre.png', price: 59.99, quantity: 2),
    CartItem(image: 'assets/tyre.png', price: 59.99, quantity: 2),
    CartItem(image: 'assets/tyre.png', price: 59.99, quantity: 2),
    CartItem(image: 'assets/tyre.png', price: 59.99, quantity: 2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  child: ListTile(
                    leading: Image.asset(item.image),
                    title: Text('\$${item.price.toStringAsFixed(2)}'),
                    subtitle: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {},
                        ),
                        Text(item.quantity.toString()),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => {},
                        ),
                        Container(
                          height: 30,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 255, 255, 255)),
                          child: const Center(
                              child: Text(
                            "Buy",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                        )
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {},
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 255, 255, 255)),
            child: const Center(
                child: Text(
              'Buy',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
