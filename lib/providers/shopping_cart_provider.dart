import 'package:flutter/material.dart';
import 'package:shopping_cart_app_provider/models/cart_item.dart';
import 'package:shopping_cart_app_provider/models/product.dart';

class ShoppingCartProvider extends ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'Nestea Bottle',
      price: 30,
      imageUrl:
          'https://th.bing.com/th/id/OIP.z6jYzUxPIv6fj5j8_lQG6gHaHa?rs=1&pid=ImgDetMain',
    ),
    Product(
      id: '2',
      name: 'Adidas Shoes',
      price: 100,
      imageUrl:
          'https://th.bing.com/th/id/OIP.Vui1gAtnHmqJTYC5Xi0kMgHaFC?w=357&h=197&c=7&r=0&o=5&dpr=2&pid=1.7',
    ),
  ];

  final List<CartItem> _cartItems = [];

  List<Product> get products => _products;
  List<CartItem> get cartItems => _cartItems;

  void addToCart(String productId) {
    final existingItem = _cartItems.firstWhere(
      (item) => item.productId == productId,
      orElse: () => CartItem(productId: productId, quantity: 0),
    );

    if (existingItem.quantity == 0) {
      _cartItems.add(existingItem);
    } else {
      existingItem.quantity++;
    }
    notifyListeners();
  }

  void removeFromCart(String productId) {
    _cartItems.removeWhere((item) => item.productId == productId);
    notifyListeners();
  }

  void updateQuantity(String productId, int quantity) {
    final item = cartItems.firstWhere((item) => item.productId == productId);
    item.quantity = quantity;
    notifyListeners();
  }
}
