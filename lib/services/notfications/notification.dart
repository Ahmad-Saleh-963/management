
// ignore_for_file: empty_catches, depend_on_referenced_packages

import 'dart:convert';


import 'package:firebase_messaging/firebase_messaging.dart';
import 'notification_messages.dart';
import 'notificationsA.dart';
import 'package:http/http.dart' as http;


// BackGround
Future<void> messageHandler(RemoteMessage message) async {
 // Data notificationMessage = Data.fromJson(message.data);
 await FirebaseMessaging.instance.getInitialMessage();
 // NotificationsA.showNotification(title: notificationMessage.title ,body: notificationMessage.message ,payload: 'ok');

  if(message.notification != null && message.notification?.title == "aa"){
    print("ok");
  }else{
    print("other");
  }

}

// For Ground
void firebaseMessagingListener() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if(message.notification != null && message.notification?.title == "aa"){
      print("ok");
    }else{
      print("other");
    }

  });

  FirebaseMessaging.onMessageOpenedApp.listen((message) {
    print(message);
  });




}

Future<void> sendNotification(String title,String body,String tokenn) async {

  ////////////////////

// Replace with server token from firebase console settings.

  const String serverToken = 'AAAACJsYqbI:APA91bEXThamXSHIjaFf3i6T-RzjLC5AtkO7_B5KccfNREvuNCGPZjrHXlyKjvbTyGj1jmTNZ9zD-zja7GCDK1hGeTfPCi9MGmqzwCxwJjeLESck1WlA97NHuQ1EoJJJ84ruWoTbs223';

  // final FirebaseMessaging firebaseMessaging = FirebaseMessaging();
  try{
    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{
            'body': body,
            'title': title,
            'sound' : 'true',
          },
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '1',
            'status': 'done'
          },
          'to': tokenn,
        },
      ),
    );


  }catch(e){}



}





