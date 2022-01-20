import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_soon/app/data/provider/http_request.dart';
import 'package:flutter_soon/app/data/util/public_service.dart';
import 'package:flutter_soon/app/data/util/strongUtil.dart';
import 'package:flutter_soon/app/translations/app_translations.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  initAppSystemStyle();
  initAppInfoData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('app == BuildContext');
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.tabBar,
      getPages: AppPages.pages,
      locale: const Locale('es', 'ZH'),
      translationsKeys: AppTranslation.translations,
      defaultTransition: Transition.rightToLeftWithFade,
    );
  }
}

initAppInfoData() async {
  // 初始化本地存储类
  // await StrongUtil().init();
  // 全局动态服务
  PublicService service = await PublicService().init();
  Get.put(service);

  // String? authorization = StrongUtil().getString('Authorization');
  // if (authorization != null) {
  //   ApiRequest().authorization = authorization;
  //   // Get.offAllNamed(Routes.tabBar);
  //   print('获取本地token === $authorization');
  // }
}

void initAppSystemStyle() {
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
}
