import 'package:doan_tmdt/model/product.dart';
import 'package:doan_tmdt/model/sale_product.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String diachi = "65 Huỳnh Thúc Khánh, P.Bến Nghé, Q.11";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vietcomshoes",style: TextStyle(color: Color.fromRGBO(210, 237, 224, 1),fontSize: 25,fontFamily:'Rufina'),),
        actions: [
          GestureDetector(
            child:Image.asset('assets/img/user.png',height: 50,width: 50,),
            onTap: (){},
          )
        ],
        backgroundColor: const Color.fromRGBO(46, 91, 69, 1),
      ),
      body: Container(
        color: const Color.fromRGBO(210, 237, 224, 1),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: MediaQuery.of(context).size.height/5,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(46, 91, 69, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children:[
                  GestureDetector(
                    onTap: (){
                      //todo: chuyển qua trang tìm kiếm 
                    },
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      decoration: ShapeDecoration(
                        color: const Color.fromRGBO(210, 237, 224, 0.69),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                        )
                        ),
                      child:Row(
                        children: [
                          const Icon(Icons.menu,color: Colors.white,),
                          Container(
                            width: MediaQuery.of(context).size.width - 150,
                            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: const Text("Tìm kiếm sản phẩm",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          ),
                          const Icon(Icons.search,color: Colors.white)
                        ],
                      )
                    ),
                  ),
                  //? chuyển thành model Location
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text("Giao hàng đến",style: TextStyle(color: Color.fromRGBO(210, 237, 224, 0.8)),),
                            //? Icon -> IconButton
                            Icon(Icons.location_on_outlined,color: Color.fromRGBO(210, 237, 224, 0.8),)
                          ],
                        ),  
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(diachi,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                          ],
                        ), 
                      ],
                    ),
                  )
                ]           
              ),
            ),
            //* Sản phẩm giảm giá
            Container(
              width: MediaQuery.of(context).size.width,
              height: 120,
              margin: const EdgeInsets.fromLTRB(10 , 10, 0, 5),
              child:Column(
                children: [
                  const Row(
                    children: [
                      Text("Giảm giá",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),)
                    ],
                  ),
                  Row(
                    children: [
                      SaleProduct()
                    ],
                  ),
                ],
              ),
            ),
            //* danh sach san pham
            Container(
              margin: const EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
                      Text("Sản phẩm",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                  ],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Product(),
                      Product()
                  ],)
                ],
              ),
            )
            
          ],
        ),
      ),
    );
  }
}