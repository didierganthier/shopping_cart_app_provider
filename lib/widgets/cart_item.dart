// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_app_provider/models/cart_item.dart';
import 'package:shopping_cart_app_provider/providers/shopping_cart_provider.dart';

class CartItemWidget extends StatefulWidget {
  final CartItem cartItem;

  const CartItemWidget({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  late int quantity;

  @override
  void initState() {
    quantity = widget.cartItem.quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final product = context
        .read<ShoppingCartProvider>()
        .products
        .firstWhere((product) => product.id == widget.cartItem.productId);
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
                  Text(product.name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('\$${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    if (quantity > 1) {
                      setState(() {
                        quantity--;
                      });
                      context
                          .read<ShoppingCartProvider>()
                          .updateQuantity(product.id, quantity);
                    } else {
                      context
                          .read<ShoppingCartProvider>()
                          .removeFromCart(product.id);
                    }
                  },
                  icon: const Icon(
                    Icons.delete,
                  ),
                ),
                Text('$quantity'),
                IconButton(
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                    context
                        .read<ShoppingCartProvider>()
                        .updateQuantity(widget.cartItem.productId, quantity);
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
