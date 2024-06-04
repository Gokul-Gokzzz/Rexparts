import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexparts/controller/admin_controller.dart';
import 'package:rexparts/model/admin_product_model.dart';
import 'package:rexparts/view/tyre_details/tyre_details.dart';

class TyreScreen extends StatefulWidget {
  final String? category;
  const TyreScreen({Key? key, this.category}) : super(key: key);

  @override
  _TyreScreenState createState() => _TyreScreenState();
}

class _TyreScreenState extends State<TyreScreen> {
  @override
  void initState() {
    super.initState();
    final prdProvider = Provider.of<ProductProvider>(context, listen: false);
    prdProvider.fetchProductList(widget.category ?? '');
  }

  @override
  Widget build(BuildContext context) {
    final prdProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 20),
            child: Text(
              widget.category ?? 'All Categories',
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
            child: Consumer<ProductProvider>(
              builder: (context, prdProvider, child) {
                if (prdProvider.productList.isEmpty) {
                  return Center(
                    child: Text('No Data'),
                  );
                } else {
                  return GridView.builder(
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: prdProvider.productList.length,
                    itemBuilder: (context, index) {
                      ProductModel product = prdProvider.productList[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TireDetailPage(
                                product: product,
                              ),
                            ),
                          );
                        },
                        child: GridTile(
                          child: Image.network(
                            product.imageUrl,
                            fit: BoxFit.cover,
                          ),
                          footer: GridTileBar(
                            backgroundColor: Colors.black54,
                            title: Text(
                              product.name,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
