import 'package:doan_tmdt/firebase_options.dart';
import 'package:doan_tmdt/model/bottom_appar.dart';
<<<<<<< HEAD
<<<<<<< HEAD
import 'package:doan_tmdt/screen/cart/cart_page.dart';
import 'package:firebase_core/firebase_core.dart';
=======
import 'package:doan_tmdt/screen/product_detail_page.dart';
>>>>>>> thong
import 'package:flutter/material.dart';
import 'package:doan_tmdt/screen/login/login_page.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
=======
import 'package:doan_tmdt/model/product.dart';
import 'package:doan_tmdt/model/sale_product.dart';
import 'package:doan_tmdt/model/sale_product_list.dart';
import 'package:doan_tmdt/screen/forgot_password_page.dart';
import 'package:doan_tmdt/screen/home_page.dart';
import 'package:doan_tmdt/screen/login_page.dart';
import 'package:flutter/material.dart';
void main() {
>>>>>>> vi
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
<<<<<<< HEAD
<<<<<<< HEAD
     // home: LoginScreen()
     home: MyBottomNavigator(),
=======
      home: ProductDetailScreen()
>>>>>>> thong
=======
      debugShowCheckedModeBanner: false,
      home: const LoginScreen()
>>>>>>> vi
    );
  }
}
