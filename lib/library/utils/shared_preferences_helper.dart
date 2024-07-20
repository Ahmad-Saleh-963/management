// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:management_states/library/data_structure/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SharedPreferencesHelper {
  static late SharedPreferences _preferences;
  static late SupabaseClient supabase;
  static const String LANG_CODE = 'lang_code';
  static const String SUPABASE_URL = 'https://bzerqhepgxnyqsjesrpo.supabase.co';
  static const String SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ6ZXJxaGVwZ3hueXFzamVzcnBvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjEzODQ5ODksImV4cCI6MjAzNjk2MDk4OX0.Ja4Jnheo8KT6fuOvPaEodWByf8UFVs3vCkK5nTEmBFw';

  static const String USER = 'user';
  static const String ROLE_USER = 'role_user';

  static SharedPreferences getInstance() => _preferences;

  static SupabaseClient getInstanceSupabase() => supabase;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> initSupaBase() async {
    await Supabase.initialize(
      url: SUPABASE_URL,
      anonKey: SUPABASE_ANON_KEY,
    );
    supabase = Supabase.instance.client;
  }

  static Future<void> saveCurrentAppLanguage(String code) async {
    await _preferences.setString(LANG_CODE, code);
  }

  static String? getCurrentAppLanguage() {
    return _preferences.getString(LANG_CODE);
  }

  static Future<void> saveUser(UserModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = jsonEncode(user.toJson());
    await prefs.setString(USER, userJson);
  }

  static UserModel? getUser() {
    String? userJson = _preferences.getString(USER);
    if (userJson != null) {
      Map<String, dynamic> userMap = jsonDecode(userJson);
      return UserModel.fromJson(userMap);
    }
    return null;
  }


}
