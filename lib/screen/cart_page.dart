import 'package:doan_tmdt/screen/detail_cart.dart';
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

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    int tongtien = 2000000;
    int thanhtien = 300000000;
    int dagiam = 5000000;
    const List<String> list = <String>[
      'Chọn mã giảm giá',
      'Mã giảm 1',
      'Mã giảm 2',
      'Mã giảm 3',
      'Mã giảm 4'
    ];
    String dropdownValue = list.first;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFD2EDE0),
        body: Column(
          children: [
            Expanded(
              child: cardcart(),
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  color: Color(0xFFD2EDE0),
                ),
                height: 130,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Chọn mã giảm giá',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15),
                        ),
                        Container(
                          child: DropdownMenu<String>(
                            width: 190,
                            textStyle: TextStyle(
                              fontSize: 15,
                            ),
                            initialSelection: list.first,
                            onSelected: (String? value) {
                              setState(() {
                                dropdownValue = value!;
                              });
                            },
                            dropdownMenuEntries: list
                                .map<DropdownMenuEntry<String>>((String value) {
                              return DropdownMenuEntry<String>(
                                  value: value, label: value);
                            }).toList(),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 2,
                      child: Container(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Tổng tiền: '),
                                Text('Đã giảm: '),
                                Text('Thành tiền: ')
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('$tongtien'),
                                Text('$dagiam'),
                                Text('$thanhtien')
                              ],
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 50.0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => detail_cart()));
                              },
                              child: const Text(
                                'Đặt hàng',
                                style: TextStyle(color: Colors.black),
                              )),
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
  State<cardcart> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<cardcart> {
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
                cartItem[index].count < 0
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                              ),
                              onPressed: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  'Xóa',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ))
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              hoverColor: Colors.green,
                              onPressed: () {
                                setState(() {
                                  cartItem[index].count++;
                                });
                              },
                              icon: Icon(
                                Icons.add,
                              )),
                          const SizedBox(width: 10),
                          Text('${cartItem[index].count}'),
                          const SizedBox(width: 10),
                          IconButton(
                              hoverColor: Colors.green,
                              onPressed: () {
                                setState(() {
                                  cartItem[index].count--;
                                });
                              },
                              icon: Icon(
                                Icons.remove,
                              )),
                        ],
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
