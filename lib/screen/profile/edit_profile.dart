import 'dart:html';

import 'package:doan_tmdt/screen/profile/profile_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  final TextEditingController fullname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController address = TextEditingController();
  String url = '';

   final DatabaseReference _databaseReference = FirebaseDatabase(
    databaseURL:
        'https://tmdt-bangiay-default-rtdb.asia-southeast1.firebasedatabase.app/',
  ).ref();

  List<Map<dynamic, dynamic>> Lst_user = [];
  //load data
  // Future<void> _loadData() async {
  //   try {
  //     DatabaseEvent _event = await _databaseReference.once();
  //     DataSnapshot? _dataSnapshot = _event.snapshot;
  //     if (_dataSnapshot != null && _dataSnapshot.value != null) {
  //       Map<dynamic, dynamic> data = (_dataSnapshot.value as Map)['users'];
  //       data.forEach((key, value) {
  //         Lst_user.add(value);
  //       });
  //       // print(lst_cat);
  //       // print(lst_cat[0]['namepro']);
  //     }
  //     setState(() {
        
  //     });
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
  // edit data
  void editData() async {
    await _databaseReference.child('users').child('user0').child('info').set({
      'fullname': fullname.text,
      'email':email.text,
      'phone':phone.text,
      'address':address.text,
      'url': url
    }
      
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile',style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {
            // Xử lý khi nút arrow_back được nhấn
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color.fromRGBO(46, 91, 69, 1),
      ),
      backgroundColor: Color(0xFFD2EDE0),
      body: Center(
        child:Column(
          //mainAxisAlignment: MainAxisAlignment.center, // Căn giữa theo chiều dọc
          crossAxisAlignment: CrossAxisAlignment.center, // Căn giữa theo chiều ngang
          children: [
            Stack(
              children: [
                InkWell(
                  onTap: () {
                    // Xử lý sự kiện
                    _pickImage();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color.fromARGB(255, 237, 173, 173), 
                        width: 3.0, 
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/img/avatar.jpg",
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    icon: Icon(Icons.edit),
                    color: Colors.white,
                    onPressed: () {
                      // Xử lý sự kiện khi nút chỉnh sửa được nhấn
                    },
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Column(
              //mainAxisAlignment: MainAxisAlignment.center, // Căn giữa theo chiều dọc
              crossAxisAlignment: CrossAxisAlignment.center, // Căn giữa theo chiều ngang
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                    color: const Color.fromRGBO(46, 91, 69, 1),
                    width: 2.0,
                    ),
                  ),
                  child: TextField(
                  controller: fullname,
                  decoration: InputDecoration(
                  labelText: 'Họ và tên',
                   prefixIcon: Icon(
                    Icons.account_circle,
                    color: Color.fromRGBO(46, 91, 69, 1),
                  ),
                   ),
                 ),
                 
                ),
                SizedBox(height: 13,),
                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                    color: const Color.fromRGBO(46, 91, 69, 1),
                    width: 2.0,
                    ),
                  ),
                  child: TextField(
                    controller: phone,
                  decoration: InputDecoration(
                  labelText: 'Số Điện Thoại',
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Color.fromRGBO(46, 91, 69, 1),
                  ),
                   ),
                 ),
                ),
                SizedBox(height: 13,),
                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                    color: const Color.fromRGBO(46, 91, 69, 1),
                    width: 2.0,
                    ),
                  ),
                  child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                  labelText: 'Email',
                   prefixIcon: Icon(
                    Icons.email,
                    color: Color.fromRGBO(46, 91, 69, 1),
                  ),
                   ),
                 ),
                ),
                SizedBox(height: 13,),
                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                    color: Color.fromRGBO(46, 91, 69, 1),
                    width: 2.0,
                    ),
                  ),
                  child: TextField(
                  controller: address,
                  decoration: InputDecoration(
                  labelText: 'Địa chỉ',
                   prefixIcon: Icon(
                    Icons.location_on,
                    color: Color.fromRGBO(46, 91, 69, 1),
                  ),
                   ),
                 ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                   style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(46, 91, 69, 1))
                  ),
                onPressed: () {
                 //Sử lý sự kiện button edit-----------
                 setState(() {
                  editData();
                   // _resetFormData();
                  });
                  Navigator.pop(context);
                  // Navigator.push(context, 
                  // MaterialPageRoute(builder: (context) => ProfileScreen()));
                },
                child: Text('Cập nhật thông tin',style: TextStyle(color: Color.fromRGBO(252, 255, 254, 1)),),
              ),
              ],
            ),
          ],
        )
      )
    );
  }
     Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      url = image.path;
    }
  }
}