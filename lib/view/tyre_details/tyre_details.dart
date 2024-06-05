import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexparts/controller/cart_provider.dart';
import 'package:rexparts/controller/product_details_provider.dart';
import 'package:rexparts/model/admin_product_model.dart';
import 'package:rexparts/widget/cart_items.dart';

class TireDetailPage extends StatelessWidget {
  final ProductModel product;

  const TireDetailPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pirelli Cinturato P7'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(
              product.imageUrl,
              height: 200,
            ),
            const SizedBox(height: 16),
            Text(
              product.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              'Rs : ${product.price.toString()}',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            Text(product.description),
            Consumer<ProductDetailsProvider>(
              builder: (context, value, child) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      value.decrement();
                    },
                  ),
                  Text(
                    value.i.toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      value.increment();
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                addToCart(
                  context,
                  product,
                );
                // await scafoldMessage(context);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 50),
                backgroundColor: const Color.fromARGB(255, 91, 47, 168),
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text(
                'Add to Cart',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addToCart(
    BuildContext context,
    ProductModel product,
  ) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final pro = Provider.of<ProductDetailsProvider>(context, listen: false);
    cartProvider.addToCart(
      CartItem(
        name: product.name,
        price: product.price,
        image: product.imageUrl,
        quantity: pro.i,
      ),
    );
    // scafoldMessage(context);
  }

  void scafoldMessage(BuildContext context) {
    final snackBar = SnackBar(
      content: const Text('Item added to cart'),
      action: SnackBarAction(
        label: "Back",
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
