import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_app_provider/providers/shopping_cart_provider.dart';
import 'package:shopping_cart_app_provider/screens/product_list_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ShoppingCartProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProductListScreen(),
    );
  }
}
