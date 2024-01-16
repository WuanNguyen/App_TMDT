import 'package:doan_tmdt/model/sale_product.dart';
import 'package:flutter/material.dart';

class SaleProductList extends StatefulWidget {
  const SaleProductList({super.key});

  @override
  State<SaleProductList> createState() => _SaleProductListState();
}

class _SaleProductListState extends State<SaleProductList> {
  List<String> nameList = List.filled(5, 'abc',growable: true);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      width: MediaQuery.of(context).size.width - 10,
      child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: nameList.length,
      itemBuilder: (context,index){
        return Row(
          children: [
            SaleProduct(name: nameList[index]),
          ],
        );
      }
      ) ,
    ) ;
  }
}