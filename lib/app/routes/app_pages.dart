import 'package:flutter_soon/app/bindings/tabbar_binding.dart';
import 'package:flutter_soon/app/ui/pages/appbar/tab_bar.dart';
import 'package:flutter_soon/app/ui/pages/home/shoping_detail.dart';
import 'package:get/get.dart';
part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.tabBar,
        page: () => TabBarPage(),
        binding: TabBarBinding()),
    GetPage(
      name: Routes.shopingDetail,
      page: () => ShopingDetailPage(),
    ),
  ];
}
