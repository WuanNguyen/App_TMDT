import 'package:doan_tmdt/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi{
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async{
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('Token: $fCMToken');
    initPushNotification();
  }

  void hanldeMessage(RemoteMessage? message){
    if(message == null) return;
    navigatorKey.currentState?.pushNamed(
      '/noti',
      arguments: message,
    );
  }
  Future initPushNotification() async{
    FirebaseMessaging.instance.getInitialMessage().then(hanldeMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(hanldeMessage);
  }
}