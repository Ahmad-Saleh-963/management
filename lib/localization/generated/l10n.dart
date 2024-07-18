// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `اللغة التركية`
  String get turkishLanguage {
    return Intl.message(
      'اللغة التركية',
      name: 'turkishLanguage',
      desc: '',
      args: [],
    );
  }

  /// `اللغة الإنكليزية`
  String get englishLanguage {
    return Intl.message(
      'اللغة الإنكليزية',
      name: 'englishLanguage',
      desc: '',
      args: [],
    );
  }

  /// `اللغة العربية`
  String get arabicLanguage {
    return Intl.message(
      'اللغة العربية',
      name: 'arabicLanguage',
      desc: '',
      args: [],
    );
  }

  /// `رجوع`
  String get back {
    return Intl.message(
      'رجوع',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد اتصال بالانترنت`
  String get noConnection {
    return Intl.message(
      'لا يوجد اتصال بالانترنت',
      name: 'noConnection',
      desc: '',
      args: [],
    );
  }

  /// `هل تريد الخروج من التطبيق؟`
  String get exitAppConfirm {
    return Intl.message(
      'هل تريد الخروج من التطبيق؟',
      name: 'exitAppConfirm',
      desc: '',
      args: [],
    );
  }

  /// `نعم`
  String get yes {
    return Intl.message(
      'نعم',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `لا`
  String get no {
    return Intl.message(
      'لا',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `إنهاء`
  String get cancel {
    return Intl.message(
      'إنهاء',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الدخول`
  String get login {
    return Intl.message(
      'تسجيل الدخول',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور`
  String get password {
    return Intl.message(
      'كلمة المرور',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `استخدم كلمة المرور`
  String get usePassword {
    return Intl.message(
      'استخدم كلمة المرور',
      name: 'usePassword',
      desc: '',
      args: [],
    );
  }

  /// `البريد الإلكتروني`
  String get email {
    return Intl.message(
      'البريد الإلكتروني',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `أحمد صالح`
  String get nameApp {
    return Intl.message(
      'أحمد صالح',
      name: 'nameApp',
      desc: '',
      args: [],
    );
  }

  /// `سجل الان`
  String get logNow {
    return Intl.message(
      'سجل الان',
      name: 'logNow',
      desc: '',
      args: [],
    );
  }

  /// `ليس لديك حساب ؟`
  String get notHaveAccount {
    return Intl.message(
      'ليس لديك حساب ؟',
      name: 'notHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الخروج`
  String get logOut {
    return Intl.message(
      'تسجيل الخروج',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `إنشاء حساب`
  String get createAccount {
    return Intl.message(
      'إنشاء حساب',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `الاسم الكامل`
  String get fullName {
    return Intl.message(
      'الاسم الكامل',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `رقم الهاتف`
  String get numberPhone {
    return Intl.message(
      'رقم الهاتف',
      name: 'numberPhone',
      desc: '',
      args: [],
    );
  }

  /// `العنوان`
  String get address {
    return Intl.message(
      'العنوان',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `سجل دخول`
  String get logIn {
    return Intl.message(
      'سجل دخول',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل`
  String get log {
    return Intl.message(
      'تسجيل',
      name: 'log',
      desc: '',
      args: [],
    );
  }

  /// `خطأ بالبريد الإلكتروني او كلمة المرور`
  String get emailNotFound {
    return Intl.message(
      'خطأ بالبريد الإلكتروني او كلمة المرور',
      name: 'emailNotFound',
      desc: '',
      args: [],
    );
  }

  /// `البريد الإلكتروني مسجل بالفعل`
  String get emailAlreadyFound {
    return Intl.message(
      'البريد الإلكتروني مسجل بالفعل',
      name: 'emailAlreadyFound',
      desc: '',
      args: [],
    );
  }

  /// `الاتصال بالانترنت ضعيف`
  String get badInternet {
    return Intl.message(
      'الاتصال بالانترنت ضعيف',
      name: 'badInternet',
      desc: '',
      args: [],
    );
  }

  /// `errorStatus`
  String get errorStatus {
    return Intl.message(
      'errorStatus',
      name: 'errorStatus',
      desc: '',
      args: [],
    );
  }

  /// `البريد الإلكتروني غير صحيح`
  String get errorEmail {
    return Intl.message(
      'البريد الإلكتروني غير صحيح',
      name: 'errorEmail',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور غير صحيحة`
  String get errorPassword {
    return Intl.message(
      'كلمة المرور غير صحيحة',
      name: 'errorPassword',
      desc: '',
      args: [],
    );
  }

  /// `حدث خطأ غير معروف`
  String get error {
    return Intl.message(
      'حدث خطأ غير معروف',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `فشل تحميل الصفحة`
  String get errorLoadPage {
    return Intl.message(
      'فشل تحميل الصفحة',
      name: 'errorLoadPage',
      desc: '',
      args: [],
    );
  }

  /// `إضافة مركز`
  String get addCenter {
    return Intl.message(
      'إضافة مركز',
      name: 'addCenter',
      desc: '',
      args: [],
    );
  }

  /// `شكل الخريطة`
  String get styleMap {
    return Intl.message(
      'شكل الخريطة',
      name: 'styleMap',
      desc: '',
      args: [],
    );
  }

  /// `فشل انشاء الحساب`
  String get errorCreateAccount {
    return Intl.message(
      'فشل انشاء الحساب',
      name: 'errorCreateAccount',
      desc: '',
      args: [],
    );
  }

  /// `نجحت العملية`
  String get processSuccess {
    return Intl.message(
      'نجحت العملية',
      name: 'processSuccess',
      desc: '',
      args: [],
    );
  }

  /// `فشلت العملية`
  String get processError {
    return Intl.message(
      'فشلت العملية',
      name: 'processError',
      desc: '',
      args: [],
    );
  }

  /// `خطأ في بيانات المصادقة`
  String get errorDataAuth {
    return Intl.message(
      'خطأ في بيانات المصادقة',
      name: 'errorDataAuth',
      desc: '',
      args: [],
    );
  }

  /// `فشل تسجيلك لاستلام الاشعارات`
  String get errorSetToken {
    return Intl.message(
      'فشل تسجيلك لاستلام الاشعارات',
      name: 'errorSetToken',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ar', countryCode: 'SY'),
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'tr', countryCode: 'TR'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
