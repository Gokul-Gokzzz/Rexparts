import 'package:flutter/material.dart';
import 'package:rexparts/model/admin_product_model.dart';
import 'package:rexparts/widget/details.dart';

class TireDetailPage extends StatelessWidget {
  final ProductModel product;
  const TireDetailPage({
    super.key,
    required this.product,
  });

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
            Image.asset(
              'assets/tyre.png',
              height: 200,
            ),
            const SizedBox(height: 16),
            const Text(
              'JK Tyre 165/80r14 UX Royale Tyre',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const DetailRow(label: 'Load Capacity', value: '215'),
            const DetailRow(label: 'Size', value: 'Medium'),
            const DetailRow(label: 'Section Width', value: '165 Milimetres'),
            const DetailRow(label: 'Brand', value: 'Jk Tyre'),
            const DetailRow(label: 'Name', value: 'UX Royale Tyre'),
            const DetailRow(label: 'Tyre Aspect Ratio', value: '80.0'),
            const DetailRow(label: 'Rim Size', value: '14 Inch'),
            const DetailRow(label: 'Load index', value: '100'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {},
                ),
                const Text(
                  '1',
                  style: TextStyle(fontSize: 18),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                scafoldMessage(context);
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
