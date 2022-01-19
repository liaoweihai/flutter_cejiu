import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_soon/app/data/provider/http_request.dart';
import 'package:flutter_soon/app/translations/app_translations.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/app_pages.dart';

void main() {
  initAppSystemStyle();
  // initData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  final bool ifLogin = false;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ifLogin ? Routes.tabBar : Routes.login,
      getPages: AppPages.pages,
      locale: const Locale('es', 'ZH'),
      translationsKeys: AppTranslation.translations,
      defaultTransition: Transition.rightToLeftWithFade,
    );
  }
}

void initAppSystemStyle() {
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
}

void initData() async {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences prefs = await _prefs;
  String? authorization = prefs.getString('Authorization');
  if (authorization != null) {
    ApiRequest().authorization = authorization;
    print('获取本地token === $authorization');
  }
}
