// features/product/ui/product_details_page.dart
import 'package:architecture_pattern/features/dashboard/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductModel product = ModalRoute.of(context)!.settings.arguments as ProductModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.blueAccent,
      ),
      // body: SingleChildScrollView(
      //   child: Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Center(
      //           child: Image.network(
      //             product.imageUrl,
      //             height: 200,
      //             fit: BoxFit.cover,
      //           ),
      //         ),
      //         const SizedBox(height: 20),
      //         Text(
      //           product.name,
      //           style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      //         ),
      //         const SizedBox(height: 8),
      //         Row(
      //           children: [
      //             Icon(Icons.star, color: Colors.amber),
      //             Text('${product.rating} '),
      //             Text('(${product.reviewCount} reviews)'),
      //           ],
      //         ),
      //         const SizedBox(height: 16),
      //         Text(
      //           '\$${product.price.toStringAsFixed(2)}',
      //           style: const TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
      //         ),
      //         const SizedBox(height: 20),
      //         const Text(
      //           'Description',
      //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //         ),
      //         const SizedBox(height: 8),
      //         Text(
      //           product.description,
      //           style: const TextStyle(fontSize: 16),
      //         ),
      //         const SizedBox(height: 30),
      //         Center(
      //           child: ElevatedButton(
      //             onPressed: () {
      //               ScaffoldMessenger.of(context).showSnackBar(
      //                 const SnackBar(content: Text('Added to cart')),
      //               );
      //             },
      //             style: ElevatedButton.styleFrom(
      //               padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      //               textStyle: const TextStyle(fontSize: 18),
      //             ),
      //             child: const Text('Add to Cart'),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
