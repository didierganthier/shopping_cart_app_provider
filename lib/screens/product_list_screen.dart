import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_app_provider/providers/shopping_cart_provider.dart';
import 'package:shopping_cart_app_provider/screens/cart_screen.dart';
import 'package:shopping_cart_app_provider/widgets/product_item.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          Consumer<ShoppingCartProvider>(
            builder: (context, cartProvider, child) {
              return Stack(
                alignment: Alignment.topRight,
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CartScreen()));
                    },
                  ),
                  if (cartProvider.getCartCount() > 0)
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        cartProvider.getCartCount().toString(),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                ],
              );
            },
          )
        ],
      ),
      body: Consumer<ShoppingCartProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.products.length,
            itemBuilder: (context, index) {
              final product = provider.products[index];
              return ProductItem(product: product);
            },
          );
        },
      ),
    );
  }
}
