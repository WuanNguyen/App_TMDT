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
      color:Color(0xFFD2EDE0),
      child: ListView(
      
      children: [Text("Cart Page")],
     ),
    );
  }
}