import 'package:flutter/material.dart';

class LikedProduct extends StatefulWidget {
  const LikedProduct({super.key});

  @override
  State<LikedProduct> createState() => _LikedProductState();
}

class _LikedProductState extends State<LikedProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sản phẩm đã thích'),
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