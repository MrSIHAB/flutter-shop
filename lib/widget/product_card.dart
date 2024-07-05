import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final num price;
  final String image;
  final bool isEven;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.isEven,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        // color: const Color(0x44a5a6c5),
        color: !isEven ? const Color(0x44C5A7A5) : const Color(0x44a5a6c5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),
          Text("\$$price", style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 5),
          Expanded(
            child: Image.asset(image),
          ),
        ],
      ),
    );
  }
}
