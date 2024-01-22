import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class CancelProduct extends StatefulWidget {
  const CancelProduct({Key? key}) : super(key: key);

  @override
  State<CancelProduct> createState() => _CancelProductState();
}

class _CancelProductState extends State<CancelProduct> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String getUserUIDString() {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String userUID = user.uid;
      return userUID;
    }
    return '';
  }

  final DatabaseReference _databaseReference = FirebaseDatabase(
    databaseURL: 'https://tmdt-bangiay-default-rtdb.asia-southeast1.firebasedatabase.app/',
  ).ref();

  List<Map<dynamic, dynamic>> lst_users = [];
  List<Map<dynamic, dynamic>> infoTitle = [];
  List<Map<dynamic, dynamic>> ztitle = [];

  Future<void> _loadData() async {
    try {
      DatabaseEvent _event = await _databaseReference.once();
      DataSnapshot? _dataSnapshot = _event.snapshot;
      if (_dataSnapshot != null && _dataSnapshot.value != null) {
        Map<dynamic, dynamic> data = (_dataSnapshot.value as Map)['order_completed'];
        data.forEach((key, value) {
          lst_users.add(value);
        });
      }

      String UID = getUserUIDString();
      for (var element in lst_users) {
        print("Đây là key: " + element.keys.toString());
        String UIDS = "($UID)";
        print("Đây là UID: " + UIDS);

        if (element.keys.toString() == UIDS) {
          infoTitle.add(element);
        }
      }
      for (var e in infoTitle) {
        for (var z in e.keys) {
          ztitle.add(z);
        }
      }
      setState(() {
        
      });
    } catch (e) {
      print(e.toString());
    }
    print(lst_users);
    print(infoTitle);
    print(ztitle);
  }

  String name = '';
  String imageUrl = '';
  String desc = '';
  String price = '';
  String quantity = '';
  String total = '';
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD2EDE0),
      appBar: AppBar(
        title: Text('Đã hủy đơn', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color.fromRGBO(46, 91, 69, 1),
      ),
      body: FutureBuilder<void>(
        future: _loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done && ztitle.isNotEmpty) {
            try {
              String ID = getUserUIDString();
              name = ztitle[0][ID]['name'];
              imageUrl = ztitle[0][ID]['imageUrl'];
              desc = ztitle[0][ID]['desc'];
              price = ztitle[0][ID]['price'];
              quantity = ztitle[0][ID]['quantity'];
              total = ztitle[0][ID]['total'];
            } catch (e) {
              print(e.toString());
            }
            return Column(
            children: [
            SizedBox(height: 15,),
            ListView(
              children:[
                Card(
                  margin: EdgeInsets.all(20),
                  color: Color.fromRGBO(59, 122, 91, 1),
                  child: ListTile(
                    leading: Container(
                      height: 100,
                      width: 100,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                        )
                      ),
                      child: Image.network(
                      imageUrl,
                      width: 100.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(onPressed: null, child: Text('Mua lại',style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromRGBO(59, 122, 91, 1),),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(203, 222, 213, 1)),),),

                        Text(name,style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),),
                        SizedBox(height: 8.0),

                        Row(children: [SizedBox(width: 10,), Text(desc,style: TextStyle(color: Colors.white),),SizedBox(width: 20,),Text('x'+ quantity,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)],),
                        SizedBox(height: 8.0),
                        
                        Text('Giá: '+ price + ' VND',style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),),

                        Text('Thành tiền: '+total+ ' VND',style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                )
              ] 
            )
          ],
        );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}