import 'package:firebase_messaging/firebase_messaging.dart';

class NotficationsService{

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  requsetNotficaionPermisen()async{
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      sound: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true
    );

    if(settings.authorizationStatus == AuthorizationStatus.authorized){}
    else{}}

}