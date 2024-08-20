//ProductsList

import 'package:flutter/material.dart';
import 'package:shop_app/product_cards.dart';
import 'package:shop_app/product_details.dart';
import 'package:shop_app/products.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  final List<String> categories = const [
    'All',
    'Adidas',
    'Nike',
    'Puma',
    'Reebok'
  ];

  late String selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = categories[0];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Shop\n\t\t\t\t\tShoes',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const Expanded(
                  child: TextField(
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(225, 225, 225, 1),
                          width: 3,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(225, 225, 225, 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 120,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedCategory == categories[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = categories[index];
                        });
                      },
                      child: Chip(
                        label: Text(
                          categories[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lato',
                            fontSize: 17,
                            color: isSelected ? Colors.blue : Colors.black,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: const BorderSide(
                            color: Color.fromRGBO(225, 225, 225, 1),
                            width: 2,
                          ),
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ProductDetails(product: product);
                          },
                        ),
                      );
                    },
                    child: ProductCards(
                        title: product['title'] as String,
                        price: (product['price'] as num).toDouble(),
                        image: product['imageUrl'] as String,
                        bckImage: index.isEven
                            ? const Color.fromARGB(255, 206, 243, 245)
                            : const Color.fromARGB(255, 231, 247, 250)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
