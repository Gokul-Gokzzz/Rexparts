import 'package:flutter/material.dart';

List<Map<String, dynamic>> orders = [
  {
    'Price': '9999',
    'product': 'Spare Part 1',
    'image': 'assets/tyre.png',
  },
  {
    'Price': '2999',
    'product': 'Spare Part 2',
    'image': 'assets/tyre.png',
  },
  {
    'Price': '2999',
    'product': 'Spare Part 2',
    'image': 'assets/tyre.png',
  },
  {
    'Price': '2999',
    'product': 'Spare Part 2',
    'image': 'assets/tyre.png',
  },
  {
    'Price': '2999',
    'product': 'Spare Part 2',
    'image': 'assets/tyre.png',
  },
  {
    'Price': '2999',
    'product': 'Spare Part 2',
    'image': 'assets/tyre.png',
  },
  {
    'Price': '2999',
    'product': 'Spare Part 2',
    'image': 'assets/tyre.png',
  },
];

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4.0, // Adding shadow to the card
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              leading: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(
                  orders[index]['image'],
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(orders[index]['product']),
              subtitle: Text('Price: ${orders[index]['Price']}'),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
