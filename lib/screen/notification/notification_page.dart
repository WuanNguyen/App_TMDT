import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class NotificationItem {
  final String imageUrl;
  final String title;
  final String content;
  final String date;

  NotificationItem({
    required this.imageUrl,
    required this.title,
    required this.content,
    required this.date,
  });
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<NotificationItem> notifications = [
    NotificationItem(
      imageUrl:
          'https://product.hstatic.net/1000362402/product/agct008-2_1_8ed3d98dc1964dcc9c4741a957fa30d8_master_5296d65ea6a5418cb72a868234b425dc_master.jpg',
      title: 'Đã xác nhận',
      content: 'Đơn hàng đã được cửa hàng tiếp nhận và sẻ giao đến cho bạn trong thời gian sớm nhất.',
      date: '01/08/2024',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFD2EDE0),
        body: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return NotificationCard(notification: notifications[index]);
          },
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final NotificationItem notification;

  NotificationCard({required this.notification});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[200],
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(
          notification.imageUrl,
          width: 100.0,
          height: 100.0,
          fit: BoxFit.cover,
        ),
        title: Text(notification.title,style: TextStyle(fontWeight: FontWeight.bold),),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification.content,
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 8.0),
            Text(
              '${notification.date}',
              style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
