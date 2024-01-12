import 'package:flutter/material.dart';

class WaitConfirmProduct extends StatefulWidget {
  const WaitConfirmProduct({super.key});

  @override
  State<WaitConfirmProduct> createState() => _WaitConfirmProductState();
}

class _WaitConfirmProductState extends State<WaitConfirmProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chờ xác nhận'),
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