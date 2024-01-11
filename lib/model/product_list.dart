import 'package:doan_tmdt/model/product.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List pro = List.filled(10, 'assets/img/no_image.jpg',growable: true);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300 * (pro.length / 2).ceil().toDouble(),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: (pro.length / 2).ceil(),
        itemBuilder: (context,index){
          if(pro.length% 2 != 0 && index == ((pro.length / 2).ceil()) - 1){
            return Row(
              children: [Product(img: pro[index*2])
              ],);
          }
          else{
            return Row(
              children: [
                Product(img:pro[index*2]),
                Product(img:pro[index*2+1])
              ],
            );
          }
        }

      )
    );
  }
}