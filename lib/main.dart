import 'package:flutter/material.dart';
import 'package:flutter_soon/app/translations/app_translations.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.tabBar,
      getPages: AppPages.pages,
      locale: const Locale('es', 'ZH'),
      translationsKeys: AppTranslation.translations,
      // defaultTransition: Transition.fadeIn,
    );
  }
}
