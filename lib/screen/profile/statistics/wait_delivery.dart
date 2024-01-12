import 'package:flutter/material.dart';

class WaitDelivery extends StatefulWidget {
  const WaitDelivery({super.key});

  @override
  State<WaitDelivery> createState() => _WaitDeliveryState();
}

class _WaitDeliveryState extends State<WaitDelivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chờ giao hàng'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Xử lý khi nút arrow_back được nhấn
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text('Nội dung trang edit'),
      ),
    );
  }
}