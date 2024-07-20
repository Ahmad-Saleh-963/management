import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:management_states/config/app_theme/them_app.dart';
import 'package:management_states/localization/generated/l10n.dart';
import 'package:management_states/services/audio/run_audio.dart';
import 'package:management_states/services/handle_msg/handle_messages_notifications.dart';
import 'package:management_states/utils/routes/router_screens.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:management_states/views/exam/init_exam.dart';
import 'package:management_states/views/home/home_page.dart';
import 'package:management_states/views/home/level.dart';
import 'package:management_states/views/on_run_app/splashScreen.dart';

import 'library/config/global_change_notifier.dart';
import 'library/utils/shared_preferences_helper.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message");
}
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  HandleMessagesNotifications.handleMsg(message);
}

void setupLocator() {
  GetIt.instance.registerLazySingleton<GlobalChangeNotifier>(() => GlobalChangeNotifier());
}
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  await SharedPreferencesHelper.initSupaBase();
  await Firebase.initializeApp();
  await RunAudio.initAudio();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  setupLocator();
  HandleMessagesNotifications.initMessages();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
     // routerConfig: RouterScreens.router,
      theme: ThemApp.themeData,
      home: const SplashScreen(),
    );
  }


}
