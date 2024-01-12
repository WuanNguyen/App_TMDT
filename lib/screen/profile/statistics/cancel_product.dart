import 'package:flutter/material.dart';

class CancelProduct extends StatefulWidget {
  const CancelProduct({super.key});

  @override
  State<CancelProduct> createState() => _CancelProductState();
}

class _CancelProductState extends State<CancelProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đã hủy'),
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