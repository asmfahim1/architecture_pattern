// import 'package:architecture_pattern/features/dashboard/data/models/product_model.dart';
// import 'package:flutter/material.dart';
//
// class ProductListItemCard extends StatelessWidget {
//   final ProductModel product;
//   final VoidCallback onTap;
//
//   const ProductListItemCard({super.key,
//     required this.product,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 16),
//       child: ListTile(
//         contentPadding: const EdgeInsets.all(12),
//         leading: Image.network(
//           product.imageUrl,
//           width: 60,
//           height: 60,
//           fit: BoxFit.cover,
//         ),
//         title: Text(
//           product.name,
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('\$${product.price.toStringAsFixed(2)}'),
//             const SizedBox(height: 4),
//             Row(
//               children: [
//                 Icon(Icons.star, size: 16, color: Colors.amber),
//                 Text('${product.rating} (${product.reviewCount})'),
//               ],
//             ),
//           ],
//         ),
//         trailing: Icon(Icons.arrow_forward_ios, size: 16),
//         onTap: onTap,
//       ),
//     );
//   }
// }