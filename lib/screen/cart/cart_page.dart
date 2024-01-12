import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:const Color(0xFFD2EDE0),
      child: ListView(
      
<<<<<<< HEAD:lib/screen/cart/cart_page.dart
      children: [Text("Cart Page")],
     ),
=======
      children: const [Text("Cart Page")],
    ),
>>>>>>> vi:lib/screen/cart_page.dart
    );
  }
}