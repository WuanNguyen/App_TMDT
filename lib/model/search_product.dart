import 'package:flutter/material.dart';

class SearchProduct extends StatelessWidget {
  SearchProduct({super.key,img,name,category,price});
  String img = 'assets/img/no_image.jpg';
  String name = 'White';
  String category = "category";
  int price = 1000000;
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //todo: vào trang thông tin sản phẩm

      },
      child:Container(
        width: 349,
        height: 180,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
        padding: const EdgeInsets.fromLTRB(5, 20, 10, 10),
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: const Color.fromRGBO(46, 91, 69, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          )
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
              )),
              child: Image.asset(img),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    const SizedBox(width: 70,),
                    Text("x$amount",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)
                ],),
                const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0),),
                Row(
                  children: [
                    Text(category,style: const TextStyle(fontSize: 10,color: Colors.white),)
                ],),
                const Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 0),),
                Row(
                  children: [
                    Text("Giá: $price VND",style: const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),)
                ],),
                const Padding(padding: EdgeInsets.fromLTRB(0, 1, 0, 0),),
                Row(
                  children: [
                    Text("Thành tiền: ${price*amount} VND",style: const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),)
                ],),
                const Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0),),
                GestureDetector(
                  onTap: (){
                    //todo: thêm vào giỏ hàng

                  },
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                    decoration: ShapeDecoration(
                      color: const Color.fromRGBO(210, 237, 224, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    )),
                    child:const Row(
                      children: [
                        Icon(Icons.add,color: Color.fromRGBO(46, 91, 69, 1),),
                        Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 0)),
                        Text("Thêm vào giỏ",style: TextStyle(color: Color.fromRGBO(46, 91, 69, 1),fontWeight: FontWeight.bold))
                      ],)
                  ),
                )
              ]
            )
          ],
        ),
      ),
    );
  }
}