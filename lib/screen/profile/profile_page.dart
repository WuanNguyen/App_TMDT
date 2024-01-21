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
 final FirebaseAuth _auth = FirebaseAuth.instance;

 String getUserUIDString() {
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    // Kiểm tra xem user có khác null không trước khi truy cập thuộc tính uid
    String userUID = user.uid;
    return userUID;
  }
  // Trả về một giá trị mặc định hoặc chuỗi trống tùy thuộc vào yêu cầu của bạn
  return ''; // hoặc return 'Giá trị mặc định';
}
//------------------------------------------------------------
  final DatabaseReference _databaseReference = FirebaseDatabase(
    databaseURL:
        'https://tmdt-bangiay-default-rtdb.asia-southeast1.firebasedatabase.app/',
  ).ref();
  
   List<Map<dynamic, dynamic>> lst_users = [];
   List<Map<dynamic, dynamic>> infoTitle = [];


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
      String UID = getUserUIDString();
      for( var element in lst_users)
      {
       print("Đây là key: " + element.keys.toString());
       String UIDS = "($UID)"; 
       print("Đây là UID: "+ UIDS);
       
        if(element.keys.toString() == UIDS){
          infoTitle.add(element);
        }
      }

      setState(() {
        
      });
    } catch (e) {
      print(e.toString());
      
    }
    print(lst_users); 
     print(infoTitle);
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
    
  
  String ID = getUserUIDString();
    try{
     name = infoTitle[0][ID]['fullname'];
     url = infoTitle[0][ID]['url'];
      //name = infoTitle[0]['fullname'];
      // name = lst_users[0]['-NoDL5o87-Gj7rEwKmvB']['fullname'];
      // url = lst_users[0]['-NoDL5o87-Gj7rEwKmvB']['url'];
    }catch(e){
      print(e.toString());
    }
    print("Đây là name: "+name);
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
                color: const Color.fromARGB(255, 239, 190, 190),
                width: 3.0,
              ),
            ),
            child: ClipOval(
              child: url != null && url.isNotEmpty
                  ? Image.network(
                      url,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      // Thay thế bằng một widget hoặc hiệu ứng khác khi không có URL hợp lệ
                      color: Colors.grey, // Ví dụ: Màu xám
                    ),
            ),
          ),

          const SizedBox(height: 10),
          Text(name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 124, 10, 103)),),
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