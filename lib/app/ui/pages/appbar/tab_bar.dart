import 'dart:math';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_cejiu/app/controller/tabbar/tabbar_controller.dart';

import 'package:get/get.dart';

class TabBarPage extends GetView<TabBarController> {
  TabBarPage({Key? key}) : super(key: key);

  //全局状态控制器
  // final globalStateController = Get.find<TabBarController>();

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('tabbar build  了饿了乐乐乐');
    }

    // ///适配工具初始化
    // ScreenUtil.init(
    //     BoxConstraints(
    //         maxWidth: MediaQuery.of(context).size.width,
    //         maxHeight: MediaQuery.of(context).size.height),
    //     context: context,
    //     designSize: const Size(375, 957),
    //     minTextAdapt: true,
    //     orientation: Orientation.portrait);

    ScreenUtil.init(context, designSize: const Size(375, 957));

    return Scaffold(
      body: PageView.builder(
          physics: const NeverScrollableScrollPhysics(), //禁止页面左右滑动切换
          controller: controller.pageController,
          itemCount: controller.widgetOptions.length,
          itemBuilder: (BuildContext context, int index) =>
              controller.widgetOptions[index]),
      bottomNavigationBar: ConvexAppBar(
        key: controller.appBarKey,
        items: controller.items,
        initialActiveIndex: controller.tabCurrentIndex,
        activeColor: Colors.amber[800],
        backgroundColor: Colors.white,
        color: Colors.black54,
        curveSize: 68.w,
        height: max(50.h, 50),
        top: -20.h,
        onTap: (int index) {
          controller.tabCurrentIndex = index;
        },
        onTabNotify: (i) {
          return controller.onTabNotify(i);
        },
      ),
    );
  }
}
