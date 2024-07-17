import 'package:flutter/material.dart';
import 'package:management_states/config/app_theme/them_app.dart';
import 'package:management_states/localization/generated/l10n.dart';
import 'package:management_states/utils/routes/router_screens.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'library/utils/shared_preferences_helper.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
 await SharedPreferencesHelper.init();
 await SharedPreferencesHelper.initSupaBase();
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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      routerConfig: RouterScreens.router,
      theme: ThemApp.themeData,
    );
  }


}
