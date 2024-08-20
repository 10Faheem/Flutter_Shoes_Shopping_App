//home_page.dart

import 'package:flutter/material.dart';
import 'package:shop_app/cart.dart';
import 'package:shop_app/products_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  List<Widget> pages = const [ProductsList(), Cart()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          selectedItemColor: Colors.blue,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          currentIndex: currentPage,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                // color: Colors.blue,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  setState(() {
                    currentPage = 1; // Navigate to Cart page
                  });
                },
              ),
              label: '',
            ),
          ]),
    );
  }
}
