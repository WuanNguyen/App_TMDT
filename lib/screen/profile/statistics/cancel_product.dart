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
 
  final cancel = FirebaseDatabase.instance.ref('order_cancel/HoX7ezQkRZVZe6W6up2OafmzNiV2');
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
      body: Column(
        children: [
           Expanded(
              child: FirebaseAnimatedList(query: cancel, itemBuilder:(BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
                Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic> ;
                String imageUrl = values['imageUrl'];
                return Card(
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
                        Text(snapshot.child('name').value.toString(),style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),),
                        SizedBox(height: 8.0),
                        Row(children: [SizedBox(width: 20,), Text(snapshot.child('desc').value.toString(),style: TextStyle(color: Colors.white),),SizedBox(width: 40,),Text('x'+ snapshot.child('quantity').value.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)],),
                        SizedBox(height: 8.0),
                        Text('Giá: '+ snapshot.child('price').value.toString() + ' VND',style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),),
                        Text('Thành tiền: '+snapshot.child('total').value.toString() + ' VND',style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                );
              }
              )
           ) 
        ],
      )
    );
  }
}