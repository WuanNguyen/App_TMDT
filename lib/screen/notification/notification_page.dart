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
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String getUserUIDString() {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String userUID = user.uid;
      return userUID;
    }
    return '';
  }

  final DatabaseReference _databaseReference = FirebaseDatabase(
    databaseURL: 'https://tmdt-bangiay-default-rtdb.asia-southeast1.firebasedatabase.app/',
  ).ref();

  List<Map<dynamic, dynamic>> lst_users = [];
  List<Map<dynamic, dynamic>> infoTitle = [];
  List<Map<dynamic, dynamic>> ztitle = [];

  Future<void> _loadData() async {
    try {
      DatabaseEvent _event = await _databaseReference.once();
      DataSnapshot? _dataSnapshot = _event.snapshot;
      if (_dataSnapshot != null && _dataSnapshot.value != null) {
        Map<dynamic, dynamic> data = (_dataSnapshot.value as Map)['notification'];
        data.forEach((key, value) {
          lst_users.add(value);
        });
      }
      String UID = getUserUIDString();
      for (var element in lst_users) {
        print("Đây là key: " + element.keys.toString());
        String UIDS = "($UID)";
        print("Đây là UID: " + UIDS);

        if (element.keys.toString() == UIDS) {
          infoTitle.add(element);
        }
      }
      for (var e in infoTitle) {
        for (var z in e.keys) {
          ztitle.add(z);
        }
      }
      setState(() {
        
      });
    } catch (e) {
      print(e.toString());
    }
    print(lst_users);
    print(infoTitle);
    print(ztitle);
  }

  String date = '';
  String imageUrl = '';
  String desc = '';
  String title = '';
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD2EDE0),
      body: FutureBuilder<void>(
        future: _loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done && ztitle.isNotEmpty) {
            try {
              String ID = getUserUIDString();
              date = ztitle[0][ID]['date'];
              imageUrl = ztitle[0][ID]['imageUrl'];
              desc = ztitle[0][ID]['desc'];
              title = ztitle[0][ID]['title'];
            } catch (e) {
              print(e.toString());
            }
            return Column(
            children: [
            SizedBox(height: 15,),
            ListView(
              children:[
                Card(
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
                    title: Text(title,style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(desc,style: TextStyle(fontSize: 15),),
                        SizedBox(height: 8.0),
                        Text(date,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                )
              ] 
            )
          ],
        );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
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
