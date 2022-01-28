import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cejiu/app/data/repository/tabbar_repository.dart';
import 'package:flutter_cejiu/app/data/util/storage_service.dart';
import 'package:flutter_cejiu/app/routes/app_pages.dart';
import 'package:flutter_cejiu/app/ui/pages/home/home_page.dart';
import 'package:flutter_cejiu/app/ui/pages/market/market_page.dart';
import 'package:flutter_cejiu/app/ui/pages/mine/mine_page.dart';
import 'package:flutter_cejiu/app/ui/pages/shopping_cart/shopping_cart_page.dart';
import 'package:get/get.dart';

class TabBarController extends GetxController {
  final TabBarRepository repository = TabBarRepository();

  final GlobalKey<ConvexAppBarState> appBarKey = GlobalKey<ConvexAppBarState>();

  final _tabCurrentIndex = 0.obs;

  set tabCurrentIndex(value) {
    if (_tabCurrentIndex.value != value) {
      _tabCurrentIndex.value = value;
      pageController.jumpToPage(value);
      appBarKey.currentState?.animateTo(value);
    }
  }

  get tabCurrentIndex => _tabCurrentIndex.value;

  final items = <TabItem>[
    const TabItem(icon: Icons.home, title: '主页'),
    const TabItem(icon: Icons.article, title: '市场'),
    const TabItem(icon: Icons.shopping_cart, title: '购物车'),
    const TabItem(icon: Icons.perm_identity, title: '我的'),
  ];

  final widgetOptions = <Widget>[
    const HomePage(),
    const MarketPage(),
    const ShopingCartPage(),
    const MinePage()
  ];

  final PageController pageController = PageController();

  bool onTabNotify(int idx) {
    bool _isGoto = true;

    if ((idx == 1 || idx == 2 || idx == 3) &&
        Get.find<StorageService>().isLogin == false) {
      Get.toNamed(Routes.login);
      _isGoto = false;
    }
    return _isGoto;
  }
}
