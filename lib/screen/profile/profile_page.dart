import 'package:doan_tmdt/screen/profile/edit_profile.dart';
import 'package:doan_tmdt/screen/profile/statistics/cancel_product.dart';
import 'package:doan_tmdt/screen/profile/statistics/completed.dart';
import 'package:doan_tmdt/screen/profile/statistics/history.dart';
import 'package:doan_tmdt/screen/profile/statistics/liked_product.dart';
import 'package:doan_tmdt/screen/profile/statistics/wait_confirm_product.dart';
import 'package:doan_tmdt/screen/profile/statistics/wait_delivery.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
//-------------------------------------------------------------


//------------------------------------------------------------
  final DatabaseReference _databaseReference = FirebaseDatabase(
    databaseURL:
        'https://tmdt-bangiay-default-rtdb.asia-southeast1.firebasedatabase.app/',
  ).ref();
  
   List<Map<dynamic, dynamic>> lst_users = [];

  Future<void> _loadData() async {
    try {
      DatabaseEvent _event = await _databaseReference.once();
      DataSnapshot? _dataSnapshot = _event.snapshot;
      if (_dataSnapshot != null && _dataSnapshot.value != null) {
        Map<dynamic, dynamic> data = (_dataSnapshot.value as Map)['infomation'];
        data.forEach((key, value) {
          lst_users.add(value);
        });
      }
      setState(() {
        
      });
    } catch (e) {
      print(e.toString());
    }
  }

   String name = '';
   String url = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }
  @override
  Widget build(BuildContext context) {
    //---------------
    try{
      name = lst_users[0]['-NoDL5o87-Gj7rEwKmvB']['fullname'];
      url = lst_users[0]['-NoDL5o87-Gj7rEwKmvB']['url'];
    }catch(e){
      print(e.toString());
    }

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color(0xFFD2EDE0),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color.fromARGB(255, 239, 190, 190), // Màu của viền
                width: 3.0, // Độ rộng của viền
              ),
            ),
            child: ClipOval(
              child: Image.network(
                url,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(name),
          // const Text(
          //   "Nguyễn Huân", style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
          //   //  textAlign: TextAlign.center,
          // ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(46, 91, 69, 1))
                  ),
            onPressed: () {
              //Sử lý sự kiện đưa trang edit
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => EditProfile()));
            },
            child: Text('Edit Profile',style: TextStyle(color: Colors.white),),
          ),
          const SizedBox(height: 15),
          //thanh công cụ-------------------------------------------------------------------------------------
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 235, 245, 240),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: (){
                          //Sử lý sự kiện nút nhấn
                          Navigator.push(context,MaterialPageRoute(builder: (context)=> WaitConfirmProduct()));
                        },
                        child: Icon(Icons.hourglass_full),
                      ),
                      Text('Chờ xác nhận')
                    ],
                  )
                ),
                Container(
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: (){
                          //Sử lý sự kiện nút nhấn
                          Navigator.push(context,MaterialPageRoute(builder: (context)=> CancelProduct()));
                        },
                        child: Icon(Icons.cancel),
                      ),
                      Text('Đã hủy')
                    ],
                  )
                ),
                Container(
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: (){
                          //Sử lý sự kiện nút nhấn
                          Navigator.push(context,MaterialPageRoute(builder: (context)=> WaitDelivery()));
                        },
                        child: Icon(Icons.local_shipping),
                      ),
                      Text('Đang giao')
                    ],
                  )
                ),
                Container(
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: (){
                          //Sử lý sự kiện nút nhấn
                          Navigator.push(context,MaterialPageRoute(builder: (context)=> Completed()));
                        },
                        child: Icon(Icons.check_circle),
                      ),
                      Text('Đã giao')
                    ],
                  )
                ),
              ],
            ),
          ),
          //Thanh công cụ dưới-------------------------------------------------------------------------------------------------
          SizedBox(height: 15,),
          Container(
            child: Column(
              children: [
                Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => Historys()));
                    },
                    child: Row(
                      children: [
                        SizedBox(width: 5,),
                          Icon(Icons.shopping_cart),
                          SizedBox(width: 10,),
                          Text('Những sản phẩm đã mua'),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios_outlined)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 13,),
                 Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => LikedProduct()));
                    },
                    child: Row(
                      children: [
                        SizedBox(width: 5,),
                          Icon(Icons.heart_broken),
                          SizedBox(width: 10,),
                          Text('Những sản phẩm đã thích'),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios_outlined)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 13,),
                 Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => LikedProduct()));
                    },
                    child: Row(
                      children: [
                        SizedBox(width: 5,),
                          Icon(Icons.app_registration_rounded),
                          SizedBox(width: 10,),
                          Text('Tiện ích khác'),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios_outlined)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 13,),
                 Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => LikedProduct()));
                    },
                    child: Row(
                      children: [
                        SizedBox(width: 5,),
                          Icon(Icons.people_alt_outlined),
                          SizedBox(width: 10,),
                          Text('Hổ trợ khách hàng'),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios_outlined)
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
    
  }
}