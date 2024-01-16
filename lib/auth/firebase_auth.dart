import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FirebAuth {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String UID = "";

  void signUp(String email, String password, Function onSuccess) {
    _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((user) => {
               if (user?.user != null) {
                UID = user.user!.uid,
                _createUser(UID,email,password,onSuccess),

                print(user)
              } 
            });
  }
  void signIn(String email,String password, Function onSuccess){
    _firebaseAuth.signInWithEmailAndPassword(email: email, password: password).then((user) => {
      //thanh cong
      onSuccess(),
    }).catchError((err){
      // messenger đăng nhập thất bại
     // String logSignIn = "đăng nhập thất bại";
    });
  }

  _createUser(String userId, String email,String password,Function onSuccess) {
    var user = {"email": email, "password": password,"uid":userId};
    var ref = FirebaseDatabase.instance.reference().child('users');
    ref.child(userId).set(user).then((user) => {
      onSuccess()
    }).catchError((err){
      // messenger đăng nhập thất bại
     // String logcreat = "Đăng kí thất bại";
    });
  }
}
