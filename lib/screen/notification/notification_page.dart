import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

// class NotificationItem {
//   final String imageUrl;
//   final String title;
//   final String content;
//   final String date;

//   NotificationItem({
//     required this.imageUrl,
//     required this.title,
//     required this.content,
//     required this.date,
//   });
// }

class _NotificationScreenState extends State<NotificationScreen> {
  // final List<NotificationItem> notifications = [
  //   NotificationItem(
  //     imageUrl:
  //         'https://cdn.tgdd.vn/Files/2022/05/28/1435541/cach-chon-size-giay-nike-air-force-1-chuan-vua-ban-chan-202205300637505742.jpg',
  //     title: 'Thông báo 1',
  //     content: 'Nội dung thông báo 1',
  //     date: '01/08/2024',
  //   ),
  // ];
  final notificationn = FirebaseDatabase.instance.ref('notification/HoX7ezQkRZVZe6W6up2OafmzNiV2');
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
                  margin: EdgeInsets.all(10),
                  color: Colors.green[200],
                  child: ListTile(
                     leading: Container(
                      height: 100,
                      width: 100,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                        )
                      ),
                      child: Image.network(
                      imageUrl,
                      width: 100.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(snapshot.child('title').value.toString(),style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(snapshot.child('desc').value.toString(),style: TextStyle(fontSize: 15),),
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

// class NotificationCard extends StatelessWidget {
//   final NotificationItem notification;

//   NotificationCard({required this.notification});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Colors.green[200],
//       margin: EdgeInsets.all(8.0),
//       child: ListTile(
//         leading: Image.network(
//           notification.imageUrl,
//           width: 100.0,
//           height: 100.0,
//           fit: BoxFit.cover,
//         ),
//         title: Text(notification.title),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               notification.content,
//               style: TextStyle(fontSize: 15),
//             ),
//             SizedBox(height: 8.0),
//             Text(
//               '${notification.date}',
//               style: TextStyle(fontSize: 8),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
