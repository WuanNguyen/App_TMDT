import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Color(0xFFD2EDE0),
      child: ListView(
        children: [
          Container(
            width: 393,
            height: 300,
            decoration: const ShapeDecoration(
              color: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.arrow_back,color: Colors.white,size: 35,),
                      ),
                      const Text("Jordan fake",style: TextStyle(color: Colors.white,fontSize: 25,decoration: TextDecoration.none),),
                    ],
                  ),
                ),
                Column(
                  children: [
                      Container(
                        child: Image.asset('assets/img/Jordan.png',height: 150,width: MediaQuery.of(context).size.width,),
                      ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text('1.500.000 VND',style: TextStyle(color: Colors.white,fontSize: 25,decoration: TextDecoration.none)),
                      Spacer(),
                      IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.favorite),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text("Mô tả",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,decoration: TextDecoration.none),),
                      ),
                      Container(
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 320,
                                  child: const Text('Là một sản phẩm thời trang đang được yêu thích bởi giới trẻ hiện nay.',softWrap: true,style: TextStyle(color: Colors.black,fontSize: 15,decoration: TextDecoration.none,fontWeight: FontWeight.normal),),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Text("Size",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,decoration: TextDecoration.none),),
                            ],
                          )
                        ),
                        Container(
                          width: 370,
                          child: Padding(
                            padding: EdgeInsets.all(0.1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: GestureDetector(
                                    onTap: (){},
                                    child: Container(
                                      width: 90,
                                      padding: EdgeInsets.all(0.1),
                                      color: Colors.transparent,
                                      child: ElevatedButton(
                                      onPressed: (){},
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(90, 50),
                                        backgroundColor: Colors.transparent,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(50),
                                          ),
                                        ),
                                      ),
                                      child: Text("39",style: TextStyle(color: Colors.black))
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: GestureDetector(
                                    onTap: (){},
                                    child: Container(
                                      width: 90,
                                      padding: EdgeInsets.all(0.1),
                                      child: ElevatedButton(
                                      onPressed: (){},
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(90, 50),
                                        backgroundColor: Colors.transparent,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(50),
                                          ),
                                        ),
                                      ),
                                      child: Text("40",style: TextStyle(color: Colors.black))
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: GestureDetector(
                                    onTap: (){},
                                    child: Container(
                                      width: 90,
                                      padding: EdgeInsets.all(0.1),
                                      child: ElevatedButton(
                                      onPressed: (){},
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(90, 50),
                                        backgroundColor: Colors.transparent,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(50),
                                          ),
                                        ),
                                      ),
                                      child: Text("41",style: TextStyle(color: Colors.black))
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: 257,
                          child: Padding(
                            padding: EdgeInsets.all(0.1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: GestureDetector(
                                    onTap: (){},
                                    child: Container(
                                      width: 90,
                                      padding: EdgeInsets.all(0.1),
                                      child: ElevatedButton(
                                      onPressed: (){},
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(90, 50),
                                        backgroundColor: Colors.transparent,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(50),
                                          ),
                                        ),
                                      ),
                                      child: Text("42",style: TextStyle(color: Colors.black))
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: GestureDetector(
                                    onTap: (){},
                                    child: Container(
                                      width: 90,
                                      padding: EdgeInsets.all(0.1),
                                      child: ElevatedButton(
                                      onPressed: (){},
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(90, 50),
                                        backgroundColor: Colors.transparent,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(50),
                                          ),
                                        ),
                                      ),
                                      child: Text("43",style: TextStyle(color: Colors.black))
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.all(5),
                          child: Text("Chính sách",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,decoration: TextDecoration.none),),
                        ),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 320,
                                  child: const Text('Chúng tôi cam kết hàng đúng như mô tả có thể trả hàng trong vòng 7 ngày.',softWrap: true,style: TextStyle(color: Colors.black,fontSize: 15,decoration: TextDecoration.none,fontWeight: FontWeight.normal),),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: 370,
                          child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 50),
                                backgroundColor: Color.fromARGB(255, 20, 111, 29),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                ),
                              ),
                              child: const Text(
                                'Thêm vào giỏ hàng',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          )),
                          ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}