import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexparts/controller/cart_provider.dart';
import 'package:rexparts/model/admin_product_model.dart';
import 'package:rexparts/model/cart_model.dart';
import 'package:rexparts/view/payment_Screen/razorpay.dart';
import 'package:rexparts/view/tyre_details/tyre_details.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CartProvider>(context, listen: false).fetchCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartProvider.cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartProvider.cartItems[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TireDetailPage(
                              product: item.toProductModel(),
                            ),
                          ),
                        );
                      },
                      child: Card(
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
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PaymentScreen(
                                        productAmount: item.totalPrice,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 40,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Buy',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          leading: Image.network(item.imageUrl),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              _showDeleteDialog(context, cartProvider, item);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal: Rs. ${cartProvider.subtotal.toStringAsFixed(2)}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentScreen(
                              productAmount: cartProvider.subtotal,
                            ),
                          ),
                        );
                      },
                      child: Text('Place Order'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showDeleteDialog(
      BuildContext context, CartProvider cartProvider, CartModel item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Do you want to remove ${item.name}?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () async {
                await cartProvider.removeFromCart(item.id);
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

extension on CartModel {
  ProductModel toProductModel() {
    return ProductModel(
      id: id,
      name: name,
      description: 'Description of $name', // Add appropriate description
      imageUrl: imageUrl,
      price: price,
    );
  }
}
