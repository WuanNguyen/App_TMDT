import 'package:doan_tmdt/screen/cart_page.dart';
import 'package:doan_tmdt/screen/home_page.dart';
import 'package:doan_tmdt/screen/login_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

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
              color: Color.fromARGB(255, 164, 210, 248),
              image: DecorationImage(
                image: AssetImage('assets/img/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              children: [
                Container(
                  // color: Colors.amber,
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/img/avatar.jpg',
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                const SizedBox(width: 13),
                Container(
                  child: const Text(
                    "Huan Nopro",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 249, 240)),
                  ),
                ),
              ],
            ),
          ),
            ListTile(
              title: const Text('Home Page'),
              onTap: () {
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
              },
            ),
            ListTile(
              title: const Text('Card Page'),
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