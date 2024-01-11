import 'package:doan_tmdt/screen/cart_page.dart';
import 'package:doan_tmdt/screen/home_page.dart';
import 'package:doan_tmdt/screen/login_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key,name});
  final String name = 'Huan nopro';
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:[
            DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(46, 91, 69, 1),
              // image: DecorationImage(
              //   image: AssetImage('assets/img/small_logo.png'),
              //   fit: BoxFit.fill,
              // ),
              // gradient: LinearGradient(
              //   colors: [
              //   Color.fromRGBO(46, 91, 69, 1),
              //   Color.fromRGBO(210, 237, 224, 1),
              //   Colors.white
              //   ],
              //   stops:[0.5,0.7,0.9],
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter
              // )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // color: Colors.amber,
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/img/avatar.jpg',
                      fit: BoxFit.cover,
                      width: 75,
                      height: 75,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  child: Text(
                    widget.name,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(210, 237, 224, 1)),
                  ),
                ),
              ],
            ),
          ),
            ListTile(
              title: const Row(
                children:[
                  Icon(Icons.home),
                  Padding(padding: EdgeInsets.only(left:8)),
                  Text('Home')]),
              onTap: () {
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
              },
            ),
            ListTile(
              title: const Row(
                children:[
                  Icon(Icons.shopping_cart),
                  Padding(padding:EdgeInsets.only(left:8)),
                  Text('Cart')]),
              onTap: () {
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
              },
            ),
            ListTile(
              title: const Row(
                children:[
                  Icon(Icons.notifications),
                  Padding(padding:EdgeInsets.only(left:8)),
                  Text('Notification')]),
              onTap: () {//
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
              },
            ),
            ListTile(
              title: const Row(
                children:[
                  Icon(Icons.account_circle_outlined),
                  Padding(padding:EdgeInsets.only(left:8)),
                  Text('Profile')]),
              onTap: () {
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
              },
            ),
            const Divider(
            color: Colors.black,
          ),
          ListTile(
            onTap: () {
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            leading: const Icon(Icons.logout),
            title: const Text("Log Out"),
          ),
          ],
        ),
      );
  }
}