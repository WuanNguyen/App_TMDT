import 'package:doan_tmdt/model/product.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  Query _dbRef = FirebaseDatabase.instance.ref().child('products');
  int sl = 8;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      
      height: 300 * (sl/2).ceil().toDouble(),
      child: 
      FirebaseAnimatedList(
        physics: const NeverScrollableScrollPhysics(),
        query: _dbRef, 
        itemBuilder: (context, snapshot, animation, index) {
          Map product = snapshot.value as Map;
          product['key'] = snapshot.key;
          
          return Row(
               children: [Product(product: product,)
               ],);
          
        }),
      


      // ListView.builder(
      //   physics: const NeverScrollableScrollPhysics(),
      //   itemCount: (pro.length / 2).ceil(),
      //   itemBuilder: (context,index){
      //     if(pro.length% 2 != 0 && index == ((pro.length / 2).ceil()) - 1){
      //       return Row(
      //         children: [Product(name: pro[index*2])
      //         ],);
      //     }
      //     else{
      //       return Row(
      //         children: [
      //           Product(name:pro[index*2]),
      //           Product(name:pro[index*2+1])
      //         ],
      //       );
      //     }
      //   }
      // )
    );
  }
}