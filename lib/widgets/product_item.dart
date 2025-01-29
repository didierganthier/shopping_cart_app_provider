import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_app_provider/models/product.dart';
import 'package:shopping_cart_app_provider/providers/shopping_cart_provider.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(
              product.imageUrl,
              height: 80,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('\$${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<ShoppingCartProvider>().addToCart(product.id);
              },
              child: const Text('Add to Cart'),
            )
          ],
        ),
      ),
    );
  }
}
