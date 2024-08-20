import 'package:flutter/material.dart';

class ProductCards extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color bckImage;
  const ProductCards({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.bckImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bckImage,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 5),
          Text('\$$price', style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 5),
          Center(
            child: Image(height: 160, image: AssetImage(image)),
          ),
        ],
      ),
    );
  }
}
