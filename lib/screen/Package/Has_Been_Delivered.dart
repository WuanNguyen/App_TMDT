import 'package:flutter/material.dart';

class HasBeenDelivered extends StatefulWidget {
  const HasBeenDelivered({super.key});

  @override
  State<HasBeenDelivered> createState() => _HasBeenDeliveredState();
}

class _HasBeenDeliveredState extends State<HasBeenDelivered> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đã giao hàng thành công',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {
            // Xử lý khi nút arrow_back được nhấn
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color.fromRGBO(46, 91, 69, 1),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(255, 220, 226, 223),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width / 1.2 ,
                height: 150,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(46, 91, 69, 1),
                  borderRadius: BorderRadius.circular(10.0), // Điều chỉnh giá trị này để thay đổi độ cong của bo góc
                ),
                child: Center(
                  child: Row(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                          )
                        ),
                        child: Image.asset('assets/img/dep.jpg',height: 125,width: 125),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Dép tổ ong',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
                          Row(children: [SizedBox(width: 25,), Text('vũ khí của má',style: TextStyle(color: Colors.white),),SizedBox(width: 40,),Text('x1',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)],),
                          Text('Giá: 1.000.000 VND',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                          Row(
                            children: [
                              ElevatedButton(onPressed: (){}, child: Text('Mua lại',style: TextStyle(color: Color.fromRGBO(59, 122, 91, 1),),),style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(20, 40)),backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(203, 222, 213, 1)),),),
                              ElevatedButton(onPressed: (){}, child: Text('Đánh giá',style: TextStyle(color: Color.fromRGBO(59, 122, 91, 1),),),style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(20, 40)),backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(203, 222, 213, 1)),),),
                            ],
                          ),
                          Text('Thành tiền: 1.000.000 VND',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width / 1.2 ,
                height: 150,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(46, 91, 69, 1),
                  borderRadius: BorderRadius.circular(10.0), // Điều chỉnh giá trị này để thay đổi độ cong của bo góc
                ),
                child: Center(
                  child: Row(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                          )
                        ),
                        child: Image.asset('assets/img/dep.jpg',height: 125,width: 125),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Dép tổ ong',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
                          Row(children: [SizedBox(width: 25,), Text('vũ khí của má',style: TextStyle(color: Colors.white),),SizedBox(width: 40,),Text('x1',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)],),
                          Text('Giá: 1.000.000 VND',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                          Row(
                            children: [
                              ElevatedButton(onPressed: (){}, child: Text('Mua lại',style: TextStyle(color: Color.fromRGBO(59, 122, 91, 1),),),style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(20, 40)),backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(203, 222, 213, 1)),),),
                              ElevatedButton(onPressed: (){}, child: Text('Đánh giá',style: TextStyle(color: Color.fromRGBO(59, 122, 91, 1),),),style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(20, 40)),backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(203, 222, 213, 1)),),),
                            ],
                          ),
                          Text('Thành tiền: 1.000.000 VND',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}