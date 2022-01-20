import 'package:flutter_soon/app/controller/home/shoping_deatil_controller.dart';
import 'package:flutter_soon/app/controller/login&reigst/login_regist_controller.dart';
import 'package:flutter_soon/app/controller/tabbar/tabbar_controller.dart';
import 'package:flutter_soon/app/ui/pages/appbar/tab_bar.dart';
import 'package:flutter_soon/app/ui/pages/home/shoping_detail.dart';
import 'package:flutter_soon/app/ui/pages/login&reigst/forget-password.dart';
import 'package:flutter_soon/app/ui/pages/login&reigst/login_page.dart';
import 'package:flutter_soon/app/ui/pages/login&reigst/regist_page.dart';
import 'package:get/get.dart';
part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.tabBar,
        page: () => TabBarPage(),
        binding: BindingsBuilder(
            () => {Get.lazyPut<TabBarController>(() => TabBarController())})),
    GetPage(
        name: Routes.login,
        page: () => const LoginPage(),
        binding: BindingsBuilder(() => {
              Get.lazyPut<LoginRegistController>(() => LoginRegistController())
            })),
    GetPage(
        name: Routes.regist,
        page: () => const RegistPage(),
        binding: BindingsBuilder(() => {
              Get.lazyPut<LoginRegistController>(() => LoginRegistController())
            })),
    GetPage(
        name: Routes.forgetPassword,
        page: () => const ForgetPasswordPage(),
        binding: BindingsBuilder(() => {
              Get.lazyPut<LoginRegistController>(() => LoginRegistController())
            })),
    GetPage(
        name: Routes.shopingDetail,
        page: () => const ShopingDetailPage(),
        binding: BindingsBuilder(() => {
              Get.lazyPut<ShopingDetailController>(
                  () => ShopingDetailController())
            })),
  ];
}
