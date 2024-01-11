import 'package:flutter/material.dart';

class SaleProduct extends StatelessWidget {
  SaleProduct({super.key,img,title,subtitle});
  final String img = "assets/img/no_image.jpg";
  final String title = "title";
  final String subtitle = "subtitle";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      //todo: chức năng nút

      },
      //* thông tin sale
      child: Container(
        height: 77,
        width: 222,
        margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
        padding: EdgeInsets.all(13),
        constraints: BoxConstraints(
          maxHeight: 77,
          maxWidth: 222
        ),
        decoration: ShapeDecoration(
          color: const Color.fromRGBO(46, 91, 69, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 50,
              width: 50,
              clipBehavior: Clip.antiAlias,
              constraints: BoxConstraints(
                maxHeight: 50,
                maxWidth: 50,
              ),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                )
              ),
              child: Image.asset(img,width: 50,height: 50,fit: BoxFit.fill,),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),),
                Text(subtitle,style: const TextStyle(fontSize: 10,color: Colors.white)),
              ],
            )
          ],
        ),
      )
    );
  }
}