import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_soon/app/data/provider/http_request.dart';
import 'package:flutter_soon/app/data/util/public_service.dart';
import 'package:flutter_soon/app/data/util/strongUtil.dart';
import 'package:flutter_soon/app/translations/app_translations.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  Global.init(() {
    runApp(const MyApp());
  });
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

void initAppSystemStyle() {
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
}

class Global {
  //初始化全局信息
  static Future init(VoidCallback callback) async {
    WidgetsFlutterBinding.ensureInitialized();

    await StrongUtil().init();
    ApiRequest().authorization = StrongUtil().getString('Authorization');
    print('获取到本地缓存的token === ${ApiRequest().authorization}');

    // 全局动态服务
    PublicService service = await PublicService().init();
    Get.put(service);

    final response = await service.getApiDict();
    if (kDebugMode) {
      print(response);
    }

    callback();
    if (Platform.isAndroid) {
      // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
      SystemUiOverlayStyle systemUiOverlayStyle =
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}
