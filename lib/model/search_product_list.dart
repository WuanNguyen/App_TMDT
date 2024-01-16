import 'package:doan_tmdt/model/search_product.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class SearchProductList extends StatefulWidget {
  const SearchProductList({super.key});

  @override
  State<SearchProductList> createState() => _SearchProductListState();
}

class _SearchProductListState extends State<SearchProductList> {
  List pro = List.filled(5, 'assets/img/green_shoes.jpg',growable: true);
  Query _db = FirebaseDatabase.instance.ref().child('products');
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(15, 5, 0, 0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 151,
          child: FirebaseAnimatedList(
            query: _db, 
            itemBuilder: (context, snapshot, animation, index){
              Map product = snapshot.value as Map;
              product['key'] = snapshot.key;
              return Row(children: [SearchProduct(product: product,)],);
            })

          // ListView.builder(
          //   itemCount: pro.length,
          //   itemBuilder: (context,index){
          //     return Row(children: [SearchProduct(img:pro[index])]);
          //   },
          // ),
        )
      ],); 
    
  }
}