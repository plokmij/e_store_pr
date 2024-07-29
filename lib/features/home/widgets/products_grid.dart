import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../data/models/product.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        mainAxisSpacing: 12,
        crossAxisSpacing: 8,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductTile(product: product);
      },
    );
  }
}

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: product.thumbnail,
              ),
            ),
            const Spacer(),
            Text(
              product.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
            ),
            const Spacer(),
            Text(
              product.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  '\$${product.price}',
                  style: const TextStyle(
                    //fontWeight: FontWeight.bold,
                    fontSize: 11,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '\$${product.discountedPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 11,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '${product.discountPercentage}% off',
                  style: const TextStyle(
                    fontSize: 11,
                    fontStyle: FontStyle.italic,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
