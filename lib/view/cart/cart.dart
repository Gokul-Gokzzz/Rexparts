import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexparts/controller/cart_provider.dart';
import 'package:rexparts/widget/cart_items.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return ListView.builder(
            itemCount: cartProvider.cartItems.length,
            itemBuilder: (context, index) {
              final item = cartProvider.cartItems[index];
              return Card(
                child: ListTile(
                  title: Text(item.name),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Rs:${item.totalPrice.toString()}'),
                          Text('Qty:${item.quantity.toString()}'),
                        ],
                      ),
                      Container(
                        height: 40,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 255, 255, 255)),
                        child: const Center(
                            child: Text(
                          'Buy',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ),
                    ],
                  ),
                  leading: Image.network(item.image),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _showDeleteDialog(context, cartProvider, item);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showDeleteDialog(
      BuildContext context, CartProvider cartProvider, CartItem item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Do you want to remove ?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                cartProvider.removeFromCart(item);
                Navigator.pop(context);
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
