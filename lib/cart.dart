// Cart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/data_provider.dart';

class Cart extends StatelessWidget {
  const Cart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<DataProvider>(context).cart;

    return Scaffold(
      appBar: AppBar(
        leading: ModalRoute.of(context)?.canPop == true
            ? IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                ),
              )
            : const SizedBox.shrink(),
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.shopping_cart,
              size: 25,
            ),
            SizedBox(width: 8),
            Text(
              'Cart',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = cartItems[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl'] as String),
              backgroundColor: Colors.blue,
              radius: 25,
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: const Color(0xFF323232),
                      title: const Text(
                        'Delete Item',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Lato',
                        ),
                      ),
                      content: const Text(
                        'Are you sure you want to delete this item from cart?',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'No',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lato',
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Provider.of<DataProvider>(context, listen: false)
                                .removeProduct(cartItem);
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Yes',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lato',
                            ),
                          ),
                        )
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            title: Text(
              cartItem['title'] as String,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            subtitle: Text('Size: ${cartItem['sizes']}'),
          );
        },
      ),
    );
  }
}
