import 'package:doan_tmdt/model/sale_product.dart';
import 'package:flutter/material.dart';

class SaleProductList extends StatefulWidget {
  const SaleProductList({super.key});

  @override
  State<SaleProductList> createState() => _SaleProductListState();
}

class _SaleProductListState extends State<SaleProductList> {
  List<String> imgList = List.filled(5, 'assets/img/user.png',growable: true);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: imgList.length,
      itemBuilder: (context,index){
        return Row(
          children: [
            Padding(padding: EdgeInsets.fromLTRB(15, 0, 0, 0)),
            SaleProduct(img: imgList[index]),
          ],
        );
      }
    );
  }
}//!load list sale item