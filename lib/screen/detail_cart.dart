import 'package:doan_tmdt/screen/adress_cart.dart';
import 'package:doan_tmdt/screen/cart_page.dart';
import 'package:flutter/material.dart';

class CartItem {
  late String imageUrl;
  late String title;
  late double size;
  late double price;
  late int count;
  CartItem(
      {required this.imageUrl,
      required this.title,
      required this.size,
      required this.price,
      required this.count});
}

class detail_cart extends StatefulWidget {
  const detail_cart({super.key});

  @override
  State<detail_cart> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<detail_cart> {
  @override
  Widget build(BuildContext context) {
    int tongtien = 2000000;
    int thanhtien = 300000000;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFD2EDE0),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => address_cart()));
                },
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.room),
                            const Text(
                              'Địa chỉ nhận hàng',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 8),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Le Quoc Thang | 033****24',
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                '24 cô giang, phường cô giang, quận 2,HCM',
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
            Expanded(child: cardcart()),
            Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  color: Colors.green[200],
                ),
                height: 80,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tổng tiền: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$tongtien',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                ),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor:
                                            const Color(0xFFD2EDE0),
                                        title: Text('Thông báo'),
                                        content: Text('Đặt hàng thành công'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              // Đóng hộp thoại khi nút được nhấn
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              'Đóng',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: const Text(
                                  'Đặt hàng',
                                  style: TextStyle(color: Colors.white),
                                )),
                            SizedBox(
                              height: 10,
                              child: Container(
                                color: Colors.white,
                              ),
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.red,
                                    fixedSize: const Size(105, 15)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CartScreen()));
                                },
                                child: const Text(
                                  'Hủy',
                                  style: TextStyle(color: Colors.white),
                                )),
                          ],
                        )
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class cardcart extends StatefulWidget {
  const cardcart({super.key});

  @override
  State<cardcart> createState() => _cart();
}

class _cart extends State<cardcart> {
  final List<CartItem> cartItem = [
    CartItem(
        imageUrl:
            'https://cdn.tgdd.vn/Files/2022/05/28/1435541/cach-chon-size-giay-nike-air-force-1-chuan-vua-ban-chan-202205300637505742.jpg',
        title: 'AF1',
        size: 20,
        price: 20000,
        count: 2),
    CartItem(
        imageUrl:
            'https://cdn.tgdd.vn/Files/2022/05/28/1435541/cach-chon-size-giay-nike-air-force-1-chuan-vua-ban-chan-202205300637505742.jpg',
        title: 'AF2',
        size: 20,
        price: 20000,
        count: 2),
    CartItem(
        imageUrl:
            'https://cdn.tgdd.vn/Files/2022/05/28/1435541/cach-chon-size-giay-nike-air-force-1-chuan-vua-ban-chan-202205300637505742.jpg',
        title: 'AF3',
        size: 20,
        price: 20000,
        count: 2),
    CartItem(
        imageUrl:
            'https://cdn.tgdd.vn/Files/2022/05/28/1435541/cach-chon-size-giay-nike-air-force-1-chuan-vua-ban-chan-202205300637505742.jpg',
        title: 'AF4',
        size: 20,
        price: 20000,
        count: -2),
    CartItem(
        imageUrl:
            'https://cdn.tgdd.vn/Files/2022/05/28/1435541/cach-chon-size-giay-nike-air-force-1-chuan-vua-ban-chan-202205300637505742.jpg',
        title: 'AF5',
        size: 20,
        price: 20000,
        count: 2),
    CartItem(
        imageUrl:
            'https://cdn.tgdd.vn/Files/2022/05/28/1435541/cach-chon-size-giay-nike-air-force-1-chuan-vua-ban-chan-202205300637505742.jpg',
        title: 'AF6',
        size: 20,
        price: 20000,
        count: 2),
    CartItem(
        imageUrl:
            'https://cdn.tgdd.vn/Files/2022/05/28/1435541/cach-chon-size-giay-nike-air-force-1-chuan-vua-ban-chan-202205300637505742.jpg',
        title: 'AF7',
        size: 20,
        price: 20000,
        count: 2),
    CartItem(
        imageUrl:
            'https://cdn.tgdd.vn/Files/2022/05/28/1435541/cach-chon-size-giay-nike-air-force-1-chuan-vua-ban-chan-202205300637505742.jpg',
        title: 'AF8',
        size: 20,
        price: 20000,
        count: 2),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartItem.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.green[200],
          margin: EdgeInsets.all(5.0),
          child: ListTile(
            leading: Image.network(
              cartItem[index].imageUrl,
              width: 100.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
            title: Text(
              cartItem[index].title,
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Size: ${cartItem[index].size}',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Giá: ${cartItem[index].price}',
                      style: TextStyle(color: Colors.amber[600]),
                    ),
                  ],
                ),
                Text(
                  'x${cartItem[index].count}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
