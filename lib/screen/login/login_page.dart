// màng hình đăng nhập

import 'package:doan_tmdt/model/bottom_appar.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController pass = TextEditingController();
  String thongbao = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("logIn Page"),),
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children:  [
            Text("Login",
              style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 400,
              height: 100,
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                  labelText: 'Tên người dùng'
                ),
              ),
            ),
            Container(
              width: 400,
              height: 100,
              child: TextField(
                controller: pass,
                decoration: InputDecoration(
                  labelText: 'Mật khẩu',
                
                ),
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: ()
                {
                  String userName = name.text;
                  String password = pass.text;
                  if(userName == "Huan"&& password == "123")
                  {
                    // đăng nhập thành công
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => MyBottomNavigator()));
                  }else{
                    setState(() {
                      thongbao = "Đăng nhập thất bại";
                    });
                  }
                },
                 child: const Text("login")
                 )
              ],
            ),
            SizedBox(height: 25),
            Text(thongbao)

        ]),
      ),
    );
  }
}