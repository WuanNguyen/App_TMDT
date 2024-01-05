import 'package:doan_tmdt/model/drawer.dart';
import 'package:doan_tmdt/screen/cart_page.dart';
import 'package:doan_tmdt/screen/home_page.dart';
import 'package:doan_tmdt/screen/notification_page.dart';
import 'package:doan_tmdt/screen/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class MyBottomNavigator extends StatefulWidget {
  const MyBottomNavigator({super.key});

  @override
  State<MyBottomNavigator> createState() => _MyBottomNavigatorState();
}

class _MyBottomNavigatorState extends State<MyBottomNavigator> {
  int _currentIndex = 0;

  List _screens = [HomeScreen(), CartScreen(), NotificationScreen(), ProfileScreen()];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("Bottom Navigation Bar"),
      ),
      body: _screens[_currentIndex],
      drawer: MyDrawer(), // Add the drawer here
      bottomNavigationBar: CurvedNavigationBar(
        
        color: Color.fromARGB(255, 28, 80, 29),
        buttonBackgroundColor: Colors.white,
        backgroundColor: Color(0xFFD2EDE0),
        animationDuration: Duration(seconds: 1),
        animationCurve: Curves.bounceOut,

        items: <Widget>[
          Icon(Icons.home,color: Color.fromARGB(255, 193, 204, 69),),
          Icon(Icons.shopping_cart,color: Color.fromARGB(255, 193, 204, 69),),
          Icon(Icons.notifications,color: Color.fromARGB(255, 193, 204, 69),),
          Icon(Icons.account_circle_outlined,color: Color.fromARGB(255, 193, 204, 69),),
        ],
        onTap: (index){
          setState(() {
            _currentIndex=index;
          });
        },


      ),
    );
  }
}
