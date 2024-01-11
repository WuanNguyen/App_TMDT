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
          'https://cdn.tgdd.vn/Files/2022/05/28/1435541/cach-chon-size-giay-nike-air-force-1-chuan-vua-ban-chan-202205300637505742.jpg',
      title: 'Thông báo 1',
      content: 'Nội dung thông báo 1',
      date: '01/08/2024',
    ),
    NotificationItem(
      imageUrl:
          'https://cdn.tgdd.vn/Files/2022/05/28/1435541/cach-chon-size-giay-nike-air-force-1-chuan-vua-ban-chan-202205300637505742.jpg',
      title: 'Thông báo 1',
      content: 'Nội dung thông báo 1',
      date: '01/08/2024',
    ),
    NotificationItem(
      imageUrl:
          'https://cdn.tgdd.vn/Files/2022/05/28/1435541/cach-chon-size-giay-nike-air-force-1-chuan-vua-ban-chan-202205300637505742.jpg',
      title: 'Thông báo 1',
      content: 'Nội dung thông báo 1',
      date: '01/08/2024',
    ),
    NotificationItem(
      imageUrl:
          'https://cdn.tgdd.vn/Files/2022/05/28/1435541/cach-chon-size-giay-nike-air-force-1-chuan-vua-ban-chan-202205300637505742.jpg',
      title: 'Thông báo 1',
      content: 'Nội dung thông báo 1',
      date: '01/08/2024',
    ),
    NotificationItem(
      imageUrl:
          'https://cdn.tgdd.vn/Files/2022/05/28/1435541/cach-chon-size-giay-nike-air-force-1-chuan-vua-ban-chan-202205300637505742.jpg',
      title: 'Thông báo 1',
      content: 'Nội dung thông báo 1',
      date: '01/08/2024',
    ),
    NotificationItem(
      imageUrl:
          'https://cdn.tgdd.vn/Files/2022/05/28/1435541/cach-chon-size-giay-nike-air-force-1-chuan-vua-ban-chan-202205300637505742.jpg',
      title: 'Thông báo 1',
      content: 'Nội dung thông báo 1',
      date: '01/08/2024',
    ),
    NotificationItem(
      imageUrl:
          'https://cdn.tgdd.vn/Files/2022/05/28/1435541/cach-chon-size-giay-nike-air-force-1-chuan-vua-ban-chan-202205300637505742.jpg',
      title: 'Thông báo 1',
      content: 'Nội dung thông báo 1',
      date: '01/08/2024',
    ),
    NotificationItem(
      imageUrl:
          'https://cdn.tgdd.vn/Files/2022/05/28/1435541/cach-chon-size-giay-nike-air-force-1-chuan-vua-ban-chan-202205300637505742.jpg',
      title: 'Thông báo 1',
      content: 'Nội dung thông báo 1',
      date: '01/08/2024',
    ),
    NotificationItem(
      imageUrl:
          'https://cdn.tgdd.vn/Files/2022/05/28/1435541/cach-chon-size-giay-nike-air-force-1-chuan-vua-ban-chan-202205300637505742.jpg',
      title: 'Thông báo 1',
      content: 'Nội dung thông báo 1',
      date: '01/08/2024',
    ),
    NotificationItem(
      imageUrl:
          'https://cdn.tgdd.vn/Files/2022/05/28/1435541/cach-chon-size-giay-nike-air-force-1-chuan-vua-ban-chan-202205300637505742.jpg',
      title: 'Thông báo 1',
      content: 'Nội dung thông báo 1',
      date: '01/08/2024',
    ),
    NotificationItem(
      imageUrl:
          'https://cdn.tgdd.vn/Files/2022/05/28/1435541/cach-chon-size-giay-nike-air-force-1-chuan-vua-ban-chan-202205300637505742.jpg',
      title: 'Thông báo 1',
      content: 'Nội dung thông báo 1',
      date: '01/08/2024',
    ),
    NotificationItem(
      imageUrl:
          'https://cdn.tgdd.vn/Files/2022/05/28/1435541/cach-chon-size-giay-nike-air-force-1-chuan-vua-ban-chan-202205300637505742.jpg',
      title: 'Thông báo 1',
      content: 'Nội dung thông báo 1',
      date: '01/08/2024',
    ),
    NotificationItem(
      imageUrl:
          'https://cdn.tgdd.vn/Files/2022/05/28/1435541/cach-chon-size-giay-nike-air-force-1-chuan-vua-ban-chan-202205300637505742.jpg',
      title: 'Thông báo 1',
      content: 'Nội dung thông báo 1',
      date: '01/08/2024',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFD2EDE0),
        // appBar: AppBar(
        //   title: const Text(
        //     'Thông báo',
        //   ),
        //   centerTitle: true,
        //   backgroundColor: const Color.fromRGBO(35, 112, 73, 100),
        // ),
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
        title: Text(notification.title),
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
              style: TextStyle(fontSize: 8),
            ),
          ],
        ),
      ),
    );
  }
}
