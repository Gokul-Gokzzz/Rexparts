import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rexparts/view/category/category.dart';
import 'package:rexparts/view/favourit/favourit.dart';
import 'package:rexparts/view/tyre_details/tyre_details.dart';
import 'package:rexparts/widget/home_widget.dart';
import 'package:rexparts/widget/slider.dart';

final slider = ['assets/slide1.jpg', 'assets/slide2.png', 'assets/slide3.jpg'];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, top: 20, bottom: 20),
                    child: Text(
                      "Rexparts",
                      style: GoogleFonts.dmSerifText(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                ],
              ),
              slide(carouselimage: slider, height: 200),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CategoryScreen(),
                            ),
                          );
                        },
                        icon: const CircleAvatar(
                          backgroundColor: Color.fromARGB(170, 159, 214, 240),
                          child: Icon(
                            Icons.list,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      const Text(
                        'Category',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FavouritesPage(),
                            ),
                          );
                        },
                        icon: const CircleAvatar(
                          backgroundColor: Color.fromARGB(170, 159, 214, 240),
                          child: Icon(
                            Icons.star_border,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      const Text(
                        'Favourits',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Suggestions',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  productContainer(
                    context: context,
                    page: const TireDetailPage(),
                    size: size,
                    image: 'assets/slide2.png',
                    name: 'Engine',
                    discountPercentage: '10%',
                  ),
                  productContainer(
                    context: context,
                    page: const TireDetailPage(),
                    size: size,
                    image: 'assets/slide2.png',
                    name: 'Engine',
                    discountPercentage: '20%',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  productContainer(
                    context: context,
                    page: const TireDetailPage(),
                    size: size,
                    image: 'assets/slide2.png',
                    name: 'Engine',
                    discountPercentage: '15%',
                  ),
                  productContainer(
                    context: context,
                    page: const TireDetailPage(),
                    size: size,
                    image: 'assets/slide2.png',
                    name: 'Engine',
                    discountPercentage: '25%',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  productContainer(
                    context: context,
                    page: const TireDetailPage(),
                    size: size,
                    image: 'assets/slide2.png',
                    name: 'Engine',
                    discountPercentage: '15%',
                  ),
                  productContainer(
                    context: context,
                    page: const TireDetailPage(),
                    size: size,
                    image: 'assets/slide2.png',
                    name: 'Engine',
                    discountPercentage: '25%',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  productContainer(
                    context: context,
                    page: const TireDetailPage(),
                    size: size,
                    image: 'assets/slide2.png',
                    name: 'Engine',
                    discountPercentage: '15%',
                  ),
                  productContainer(
                    context: context,
                    page: const TireDetailPage(),
                    size: size,
                    image: 'assets/slide2.png',
                    name: 'Engine',
                    discountPercentage: '25%',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
