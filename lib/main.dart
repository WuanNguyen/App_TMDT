import 'package:doan_tmdt/model/bottom_appar.dart';
import 'package:doan_tmdt/screen/Package/Dismis_order.dart';
import 'package:doan_tmdt/screen/Package/Has_Been_Delivered.dart';
import 'package:doan_tmdt/screen/Package/Is_Being_Deliver.dart';
import 'package:doan_tmdt/screen/Package/Wait_Comfirm.dart';
import 'package:doan_tmdt/screen/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:doan_tmdt/screen/login_page.dart';
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
      home: WaitComfirmProduct()
    );
  }
}
