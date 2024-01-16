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
                          _fireauth.signUp(email.text, password.text,(){
                            User? user = FirebaseAuth.instance.currentUser;
                            if(user != null)
                            {
                              String uid = user.uid;
                              DatabaseReference infos = FirebaseDatabase.instance.reference().child('infomation').child(uid);
                              String infoId = infos.push().key!;
                              infos.child(infoId).set({
                                'fullname':'',
                                'email':'',
                                'phone':'',
                                'address':'',
                                'url':'blob:http://localhost:50227/55ae82ca-452f-48db-a872-60a778fc3fec'
                              });
                            }
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyBottomNavigator()));
                        });
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