import 'package:doan_tmdt/model/search_product.dart';
import 'package:flutter/material.dart';

class SearchProductList extends StatefulWidget {
  const SearchProductList({super.key});

  @override
  State<SearchProductList> createState() => _SearchProductListState();
}

class _SearchProductListState extends State<SearchProductList> {
  List pro = List.filled(5, 'assets/img/green_shoes.jpg',growable: true);
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
          child: ListView.builder(
            itemCount: pro.length,
            itemBuilder: (context,index){
              return Row(children: [SearchProduct(img:pro[index])]);
            },
          ),
        )
      ],); 
    
  }
}