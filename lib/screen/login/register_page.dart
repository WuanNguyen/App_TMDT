// màng hình đăng kí
import 'package:doan_tmdt/auth/firebase_auth.dart';
import 'package:doan_tmdt/model/bottom_appar.dart';
import 'package:doan_tmdt/model/err_dialog.dart';
import 'package:doan_tmdt/screen/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var _fireauth = FirebAuth();

  final TextEditingController email =  TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController cpassword = TextEditingController();
  String TBEmail = "";
  String TBPassword = "";
  String TBCPassword = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
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
                const Padding(padding: EdgeInsets.all(32)),
                Container(
                  child: Image.asset("assets/img/small_logo.png",height: 150,width: MediaQuery.of(context).size.width,),
                ),
                const Text("Đăng Ký",style: TextStyle(fontSize: 35,color: Color.fromRGBO(210, 237, 224, 1),fontWeight: FontWeight.w500),),

                // * Vùng nhập liệu (Username + Password)
                const Padding(padding: EdgeInsets.all(20)),
                // Username
                SizedBox(
                  width: MediaQuery.of(context).size.width/1.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: email,
                        decoration: const InputDecoration(label: Text("Email",style:TextStyle(fontWeight: FontWeight.w500))),
                      ),
                      Row(
                        children: [
                          const Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0)),
                          Text(TBEmail,style: const TextStyle(color: Colors.red),)
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
                          Text(TBPassword,style: const TextStyle(color: Colors.red),)
                        ],
                      ),
                    ],
                  )
                ),
                //* Nhập lại mật khẩu
                SizedBox(
                  width: MediaQuery.of(context).size.width/1.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: cpassword,
                        obscureText: true,
                        decoration: const InputDecoration(label: Text("Nhập lại mật khẩu",style:TextStyle(fontWeight: FontWeight.w500))),
                      ),
                      Row(
                        children: [
                          const Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0)),
                          Text(TBCPassword,style: const TextStyle(color: Colors.red),)
                        ],
                      ),
                    ],
                  )
                ),

                // * Vùng nút bấm (Đăng nhập + Đăng ký)
                // Nút đăng nhập
                const Padding(padding: EdgeInsets.all(13)),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilledButton(
                      onPressed: () {
                        if(email.text.isEmpty){
                          setState(() {  
                          TBEmail = "Vui lòng nhập Email";
                          });
                        }
                        else {
                          setState(() {  
                          TBEmail = "";
                          });
                        }
                        if(password.text.isEmpty){
                          setState(() {
                            TBPassword = "Vui lòng nhập mật khẩu";
                          });
                        }
                        else {
                          setState(() {  
                          TBPassword = "";
                          });
                        }
                        if(cpassword.text.isEmpty){
                          setState(() {
                            TBCPassword = "Vui lòng nhập lại mật khẩu";
                          });
                        }
                        else {
                          setState(() {  
                          TBCPassword = "";
                          });
                        }
                        if( cpassword.text != password.text)
                        {
                          MsgDialog.ShowDialog(context, 'sign in', 'Xác nhận mật khẩu thất bại');
                        }else{
                          // --------------------------------------
                          try {
                              _fireauth.signUp(email.text, password.text, () async {
                                User? user = FirebaseAuth.instance.currentUser;
                                if (user != null) {
                                  String uid = user.uid;
                                  DatabaseReference infos = FirebaseDatabase.instance.reference().child('infomation').child(uid);
                                  await infos.child(uid).set({
                                    'fullname': 'YourName',
                                    'email': 'your_email@gmail.com',
                                    'phone': '',
                                    'address': 'your_address',
                                    'url': 'https://firebasestorage.googleapis.com/v0/b/tmdt-bangiay.appspot.com/o/images%2Favatarface.jpg?alt=media&token=7da6a34c-02df-4551-b67e-66058d33a72f'
                                  });
                                }
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const MyBottomNavigator()));
                              }, (msg) {
                                // Xử lý lỗi từ hàm signUp
                                MsgDialog.ShowDialog(context, 'Sign-In', msg);
                              });
                            } catch (e) {
                              // Xử lý lỗi khi gọi hàm signUp
                              print('Error during sign-up: $e');
                              MsgDialog.ShowDialog(context, 'Sign-In', 'An error occurred during sign-up: $e');
                            }
                        }
                         
                        // if(email.text=="Huan" && password.text=="123" && cpassword.text == password.text){
                        //   Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyBottomNavigator()));
                        // }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(120, 120, 120, 1)),
                      ),
                      child: const Text("Đăng ký",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),
                    ),
                    //Nút đăng ký
                    GestureDetector(
                      onTap: () {
                        //
                       
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                      },
                      child: const Text("Đăng nhập",style: TextStyle(fontWeight: FontWeight.w500,color: Color.fromRGBO(210, 237, 224, 1)),)
                    ),
                    
                  ],
                ),  
              ]       
            ),
          ],
        ),
      )
      
    );
  }
  // void signUp(String email, String password,Function onSuccess)
  // {
  //   _fireauth.signUp(email, password, onSuccess);
  // }
}