import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart.dart';
import 'package:shop_app/data_provider.dart';

class ProductDetails extends StatefulWidget {
  final Map<String, dynamic> product;
  const ProductDetails({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int selectedSize = 0;

  void onTap() {
    if (selectedSize != 0) {
      Provider.of<DataProvider>(context, listen: false).addProduct({
        'id': widget.product['id'],
        'title': widget.product['title'],
        'price': widget.product['price'],
        'sizes': selectedSize,
        'company': widget.product['company'],
        'imageUrl': widget.product['imageUrl'],
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product Added Successfully'),
        ),
      );
      Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return const Cart();
        },
      ),
    );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a size!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Expanded(
          child: Center(
            child: Text('Details'),
          ),
        ),
        actions: const [SizedBox(width: 48)],
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              widget.product['title'] as String,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 150,
              color: Colors.transparent,
              child: Image(
                image: AssetImage(
                  widget.product['imageUrl'] as String,
                ),
              ),
            ),
          ),
          const Spacer(flex: 2),
          Container(
            padding: const EdgeInsets.all(16),
            height: 220,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 224, 224, 224),
            ),
            child: Column(
              children: [
                Text('\$${widget.product['price']}',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 11.0, right: 10.0),
                  child: SizedBox(
                    height: 50,
                    child: Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.product['sizes'].length,
                        itemBuilder: (context, index) {
                          final size = widget.product['sizes'][index] as int;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = size;
                              });
                            },
                            child: Chip(
                              label: Text(
                                size.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: selectedSize == size
                                      ? Colors.blue
                                      : Colors.black,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: Colors.black,
                                  // width: 1.0, // Set the width of the border
                                ),

                                borderRadius: BorderRadius.circular(
                                    8.0), // Optional: round the corners
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                    width: 350,
                    child: ElevatedButton(
                      onPressed: onTap,
                      style: TextButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 185, 248, 252),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart),
                          SizedBox(width: 8), // Space between icon and text
                          Text(
                            'Add to cart',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
