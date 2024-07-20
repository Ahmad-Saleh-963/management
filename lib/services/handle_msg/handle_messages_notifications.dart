import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:management_states/library/utils/static_resources.dart';
import 'package:management_states/services/audio/run_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HandleMessagesNotifications{


 static void initMessages()async{

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      handleMsg(message);
      // يمكنك هنا إضافة الإجراءات التي تريد تنفيذها عند استلام الرسالة في التطبيق مفتوح
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      handleMsg(message);
      // يمكنك هنا إضافة الإجراءات التي تريد تنفيذها عندما يتم فتح التطبيق من الخلفية
    });

  }



 static void handleMsg(RemoteMessage message){
     if(message.notification == null)return;

     if(message.notification!.title == StaticResources.NEW_STATE){
       RunAudio.runAudio();
     }


 }




}