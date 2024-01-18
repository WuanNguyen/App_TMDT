import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

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
  final notificationn = FirebaseDatabase.instance.ref('notification');
  
  final List<NotificationItem> notifications = [
    NotificationItem(
      imageUrl:
          'https://contents.mediadecathlon.com/p2393841/97ec4616ea32d8eaa67ee3c30d2eafd2/p2393841.jpg?format=auto&quality=70&f=650x0',
      title: 'Đã xác nhận',
      content: 'Đơn hàng đã được cửa hàng tiếp nhận và sẻ giao đến cho bạn trong thời gian sớm nhất.',
      date: '01/08/2024',
    ),
    NotificationItem(
      imageUrl:
          'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/63c77c04dc6448548ccbae880189e107_9366/Giay_Galaxy_6_DJen_GW3848_01_standard.jpg',
      title: 'Đang giao hàng',
      content: 'Đơn hàng đang được shipper trên đường giao dến bạn.',
      date: '01/08/2024',
    ),
    NotificationItem(
      imageUrl:
          'https://assets.adidas.com/images/w_600,f_auto,q_auto/bd43ce71f589498ab6b1aad6009a0e6e_9366/Superstar_Shoes_White_EG4958_07_standard.jpg',
      title: 'Đã đặt hàng',
      content: 'Đơn hàng đã được đặt thành công và chờ xác nhận từ cửa hàng.',
      date: '01/08/2024',
    ),
    NotificationItem(
      imageUrl:
          'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/99486859-0ff3-46b4-949b-2d16af2ad421/custom-nike-dunk-high-by-you-shoes.png',
      title: 'Đã giao hàng thành công',
      content: 'Đơn hàng đã dến tay của bạn, mong bạn có một dịch vụ mua sắm tốt nhất từ chúng tôi.',
      date: '01/08/2024',
    ),
  ];
  String url = '';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFD2EDE0),
        body: Column(
          children: [
            Expanded(
              child: FirebaseAnimatedList(query: notificationn, itemBuilder:(BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
                Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic> ;
                String imageUrl = values['imageUrl'];
                return Card(
                  color: Colors.green[200],
                  child: ListTile(
                    leading: Image.network(
                      imageUrl,
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                      ),
                    title: Text(snapshot.child('title').value.toString(),style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5.0),
                        Text(snapshot.child('description').value.toString(),style: TextStyle(fontSize: 15),),
                        SizedBox(height: 8.0),
                        Text(snapshot.child('date').value.toString(),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                );
              } 
              ),
            )
          ],
        )
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
