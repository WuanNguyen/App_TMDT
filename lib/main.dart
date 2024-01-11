import 'package:doan_tmdt/model/bottom_appar.dart';
import 'package:doan_tmdt/model/product.dart';
import 'package:doan_tmdt/model/sale_product.dart';
import 'package:doan_tmdt/model/sale_product_list.dart';
import 'package:doan_tmdt/screen/forgot_password_page.dart';
import 'package:doan_tmdt/screen/home_page.dart';
import 'package:doan_tmdt/screen/login_page.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: MyBottomNavigator()
    );
  }
}
