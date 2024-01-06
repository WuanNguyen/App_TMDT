// màng hình đăng nhập

import 'package:doan_tmdt/model/bottom_appar.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController username =  TextEditingController();
  final TextEditingController password = TextEditingController();
  String Username_thongbao = "";
  String Password_thongbao = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: const AssetImage('assets/img/template.png'),
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Column(
            //* vùng Logo
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.all(25)),
              Container(
                child: Image.asset("assets/img/small_logo.png",height: 150,width: MediaQuery.of(context).size.width,),
              ),
              const Text("Đăng Nhập",style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.w500),),

              // * Vùng nhập liệu (Username + Password)
              const Padding(padding: EdgeInsets.all(20)),
              // Username
              SizedBox(
                width: MediaQuery.of(context).size.width/1.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: username,
                      decoration: const InputDecoration(label: Text("Tài khoản",style:TextStyle(fontWeight: FontWeight.w500))),
                    ),
                    Row(
                      children: [
                        const Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0)),
                        Text(Username_thongbao,style: TextStyle(color: Colors.red),)
                      ],
                    ),
                  ],
                )
              ),
              //Password
              SizedBox(
                width: MediaQuery.of(context).size.width/1.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: password,
                      obscureText: true,
                      decoration: const InputDecoration(label: Text("Mật khẩu",style:TextStyle(fontWeight: FontWeight.w500))),
                    ),
                    Row(
                      children: [
                        const Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0)),
                        Text(Password_thongbao,style: TextStyle(color: Colors.red),)
                      ],
                    ),
                  ],
                )
              ),

              // * Vùng nút bấm (Đăng nhập + Đăng ký)
              // Nút đăng nhập
              Padding(padding: EdgeInsets.all(10)),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton(
                    onPressed: (){
                      if(username.text.isEmpty){
                        setState(() {  
                        Username_thongbao = "Tài khoản không đúng";
                        });
                      }
                      if(password.text.isEmpty){
                        setState(() {
                          Password_thongbao = "Mật khẩu không đúng";
                        });
                      }
                      if(username.text=="Huan"&& password.text=="123"){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyBottomNavigator()));
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromRGBO(120, 120, 120, 1)),
                    ),
                    child: Text("Đăng nhập",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),
                  ),
                  //Nút đăng ký
                  GestureDetector(
                    onTap: () {},
                    child: Text("Đăng ký",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),)
                  )
                ],
              ),
              Padding(padding: EdgeInsets.all(5)),
              //quên mật khẩu
              GestureDetector(
                onTap: (){},
                child: Text("Quên mật khẩu?",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),),
              )
            ]       
          ),
        ],
      ),
    );
  }
}