import 'package:flutter/material.dart';

class Historys extends StatefulWidget {
  const Historys({super.key});

  @override
  State<Historys> createState() => _HistorysState();
}

class _HistorysState extends State<Historys> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lịch sử mua hàng'),
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