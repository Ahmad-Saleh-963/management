// ignore_for_file: constant_identifier_names

import 'dart:io';
import 'package:flutter/foundation.dart';

 class  StaticResources {
 static String hostConnect = "http://192.168.70.143/db";
 static int durationServer = 8;

static bool get isMobile => Platform.isIOS || Platform.isAndroid;
static platformType() {
  if (kIsWeb) {
    return 'Web';
  } else if (Platform.isMacOS) {
    return 'MacOS';
  } else if (Platform.isWindows) {
    return 'Windows';
  } else if (Platform.isFuchsia) {
    return 'Fuchsia';
  } else if (Platform.isAndroid) {
    return 'Android';
  } else if (Platform.isIOS) {
    return 'IOS';
  } else if (Platform.isLinux) {
    return 'Linux';
  }
}


 static String error = "error";
 static String data = "data";
 static String timeoutException = "TimeoutException";
 static String password = "password";
 static String name = "name";
 static String email = "email";


 static const String REFRECH_STATES_PAGE = "refrech_states_page";


 /// For Handle Msg
 static const String NEW_STATE = "حالة جديدة";



}
