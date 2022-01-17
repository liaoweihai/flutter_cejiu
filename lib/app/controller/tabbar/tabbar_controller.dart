import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_soon/app/data/repository/tabbar_repository.dart';
import 'package:flutter_soon/app/ui/pages/home/home_page.dart';
import 'package:flutter_soon/app/ui/pages/market/market_page.dart';
import 'package:flutter_soon/app/ui/pages/mine/mine_page.dart';
import 'package:flutter_soon/app/ui/pages/shopping_cart/shopping_cart_page.dart';
import 'package:get/get.dart';

class TabBarController extends GetxController {
  final TabBarRepository repository = TabBarRepository();

  final _tabCurrentIndex = 0.obs;

  final GlobalKey<ConvexAppBarState> appBarKey = GlobalKey<ConvexAppBarState>();

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
    const ShopingCart(),
    const MinePage()
  ];

  final PageController pageController = PageController();
}
