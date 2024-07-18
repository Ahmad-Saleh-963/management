

// ignore_for_file: depend_on_referenced_packages, file_names

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

class NotificationsA{

  static final _notifications  = FlutterLocalNotificationsPlugin();
  static final onNotifications  = BehaviorSubject<String?>();

  static Future _notificationDetails()async{

    return const NotificationDetails(
      android:AndroidNotificationDetails(
        'channel id',
        'channel name',
        'channel description',
        importance: Importance.max,
        enableLights: true,
        playSound: true,
        icon: '@mipmap/ic_launcher',

      ),
      iOS: IOSNotificationDetails(),
    );

  }

  static Future init({bool initScheduled = false})async{
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOS = IOSInitializationSettings();
    const settings = InitializationSettings(android: android,iOS: iOS);

    await _notifications.initialize(
      settings,
      onSelectNotification: (payload) async{
        onNotifications.add(payload);
      }
    );
  }

  static Future showNotification({
  int id = 0 ,
  String? title ,
  String? body ,
  String? payload ,

}) async =>
      _notifications.show(id, title, body, await _notificationDetails(),
      payload: payload,
      );


}