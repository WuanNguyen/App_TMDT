import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController search = TextEditingController(text:"");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: MediaQuery.of(context).size.width - 135,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35)
            )
          ),
          child: SearchBar(
            controller: search,
            hintText: "Tìm kiếm sản phẩm",
            hintStyle: MaterialStateProperty.all(const TextStyle(color: Color.fromRGBO(46, 91, 69, 1),fontWeight: FontWeight.bold)),
            backgroundColor: MaterialStateProperty.all(Colors.white,), //mau thanh search
            leading: const Icon(Icons.search,color: Colors.white),
            trailing: <Widget>{
              IconButton(
                icon: const Icon(Icons.close,color: Colors.white,),
                onPressed: (){
                  setState(() {
                    search = TextEditingController(text: "");
                  });
                },
              )
            },
            onSubmitted: (value) {
              //todo: tìm kiếm sản phẩm theo tên 
            },
          ),
        ),
        
        backgroundColor: const Color.fromRGBO(46, 91, 69, 1),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color.fromRGBO(210, 237, 224, 0.8),//mau ca trang
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width ,
              height: 90,
              decoration: const ShapeDecoration(
                color: Color.fromRGBO(210, 237, 224, 0.8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35)
                  )
                )
                ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                width: MediaQuery.of(context).size.width/5,
                height: 1,
              )
            ),
            
            
          ],
        ),
      ),
    );
  }
}