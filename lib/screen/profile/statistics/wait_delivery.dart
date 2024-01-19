import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class WaitDelivery extends StatefulWidget {
  const WaitDelivery({super.key});

  @override
  State<WaitDelivery> createState() => _WaitDeliveryState();
}

class _WaitDeliveryState extends State<WaitDelivery> {
  final wait_delivery = FirebaseDatabase.instance.ref('wait_delivery/tEB5GubwFQOcoohIYwdGns39N933');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD2EDE0),
      appBar: AppBar(
        title: Text('Chờ giao hàng',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {
            // Xử lý khi nút arrow_back được nhấn
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color.fromRGBO(46, 91, 69, 1),
      ),
      body: Column(
          children: [
            SizedBox(height: 15,),
            Expanded(
              child: FirebaseAnimatedList(query: wait_delivery, itemBuilder:(BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
                Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic> ;
                String imageUrl = values['imageUrl'];
                return Card(
                  color: Color.fromRGBO(59, 122, 91, 1),
                  child: ListTile(
                    leading: Image.network(
                      imageUrl,
                      height: 120,
                      width: 105,
                      fit: BoxFit.cover,
                      ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(onPressed: null, child: Text('Xem chi tiết',style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromRGBO(59, 122, 91, 1),),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(203, 222, 213, 1)),),),
                        Text(snapshot.child('name').value.toString(),style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),),
                        SizedBox(height: 8.0),
                        Row(children: [SizedBox(width: 20,), Text(snapshot.child('desc').value.toString(),style: TextStyle(color: Colors.white),),SizedBox(width: 40,),Text('x'+ snapshot.child('quantity').value.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)],),
                        SizedBox(height: 8.0),
                        Text('Giá: '+ snapshot.child('price').value.toString() + ' VNĐ',style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),),
                        Text('Thành tiền: '+snapshot.child('total').value.toString() + ' VNĐ',style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                );
              } 
              ),
            ),
            SizedBox(height: 20,),
          ],
        )
    );
  }
}