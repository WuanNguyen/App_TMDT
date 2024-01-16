import 'package:doan_tmdt/model/drawer.dart';
import 'package:doan_tmdt/model/product_list.dart';
import 'package:doan_tmdt/model/sale_product_list.dart';
import 'package:doan_tmdt/model/false_search_bar.dart';
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
      drawer: MyDrawer(),
      body: Container(
        color: const Color.fromRGBO(210, 237, 224, 1),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 150,
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
                    Search_Bar(),
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
                              Text(diachi,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
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
                child: const Column(
                  children: [
                    Row(
                      children: [
                        Text("Giảm giá",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),)
                      ],
                    ),
                    Row(
                      children: [
                        SaleProductList()
                      ],
                    ),
                  ],
                ),
              ),
              //* danh sach san pham
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
                      Text("Sản phẩm",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                  ],),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ProductList()
                  ],)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}