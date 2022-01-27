import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cejiu/app/ui/pages/a_common/app_smart_refresher.dart';
import 'package:flutter_cejiu/app/ui/pages/a_common/network_image_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_cejiu/app/controller/mine/mine_controller.dart';
import 'package:flutter_cejiu/app/controller/tabbar/tabbar_controller.dart';
import 'package:flutter_cejiu/app/data/util/storage_service.dart';
import 'package:flutter_cejiu/app/routes/app_pages.dart';
import 'package:flutter_cejiu/app/ui/theme/app_colors_util.dart';
import 'package:flutter_cejiu/app/ui/theme/app_text_util.dart';
import 'package:get/get.dart';

class MinePage extends GetView<MineController> {
  const MinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<MineController>(MineController());

    if (kDebugMode) {
      print('我的 build  了饿了乐乐乐');
    }
    return Obx(() {
      List<Widget> mineList = [
        {'title': '实名认证', 'icon': 'mine_1.png', 'pathUrl': ''},
        {'title': '绑定银行卡', 'icon': 'mine_2.png', 'pathUrl': ''},
        {'title': '商城订单', 'icon': 'mine_3.png', 'pathUrl': ''},
        {'title': '会员等级', 'icon': 'mine_4.png', 'pathUrl': ''},
        {'title': '我的好友', 'icon': 'mine_5.png', 'pathUrl': ''},
        {'title': 'Bcc转增', 'icon': 'mine_6.png', 'pathUrl': ''},
        {'title': '我的地址', 'icon': 'mine_7.png', 'pathUrl': ''},
        {'title': '我的激励', 'icon': 'mine_8.png', 'pathUrl': ''},
        {'title': '帮助中心', 'icon': 'mine_9.png', 'pathUrl': ''},
      ].map((e) {
        return mineListTitle(e);
      }).toList();

      mineList = ListTile.divideTiles(
              context: context, tiles: mineList, color: Colors.grey[200])
          .toList();

      mineList.insert(0, mineBarStack());

      if (Get.find<StorageService>().isLogin) {
        mineList.add(Container(
          margin: const EdgeInsets.only(top: 35, left: 40, right: 40),
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ColorsUtil.mainColor),
          child: TextButton(
            child: Text(
              '退出登录',
              style: SeaFont.s15BoldFontTextStyle(color: Colors.white),
            ),
            onPressed: () {
              Get.find<StorageService>().outLogin();
              Get.find<TabBarController>().tabCurrentIndex = 0;
            },
          ),
        ));
      }
      return mineListView(context, mineList: mineList);
    });
  }
}

Widget mineListView(BuildContext context, {required List<Widget> mineList}) {
  return Scaffold(
    body: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: AppRefreshView(
          enablePullUp: false,
          pageController: Get.find<MineController>(),
          child: ListView(
            children: mineList,
          ),
        )),
  );
}

ListTile mineListTitle(Map m) {
  return ListTile(
    // selectedColor: ColorsUtil.mainColor,
    title: Text(m['title']),
    contentPadding: EdgeInsets.only(left: 12.w, right: 12.w),
    leading: SizedBox(
      width: 24.r,
      height: 24.r,
      child: Image.asset('assets/icons/${m['icon']}'),
    ),
    trailing: const Icon(
      Icons.arrow_forward_ios,
      size: 15,
    ),
    onTap: () {
      if (kDebugMode) {
        if (m['title'] == '商城订单') {
          print('回到首页');
          final globalStateController = Get.find<TabBarController>();
          globalStateController.tabCurrentIndex = 0;
        } else if (m['title'] == '帮助中心') {
          Get.toNamed(Routes.login);
        }
        print(m);
      }
    },
  );
}

Stack mineBarStack() {
  return Stack(alignment: AlignmentDirectional.topCenter, children: [
    SizedBox(
      width: 1.sw,
      height: 156.h + ScreenUtil().statusBarHeight,
      child: Image.asset(
        'assets/icons/gerenzhonxinbeijing.png',
        fit: BoxFit.fill,
      ),
    ),
    Positioned(
      top: 47.h + ScreenUtil().statusBarHeight,
      width: 1.sw,
      child: GetBuilder<MineController>(
        id: 'myUserInfo',
        builder: (_) {
          return Row(
            // direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              userIcon(_),
              Expanded(
                child: Get.find<StorageService>().isLogin == false
                    ? GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.login);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '登录/注册',
                            style: SeaFont.s15BoldFontTextStyle(
                                color: Colors.white),
                          ),
                        ),
                      )
                    : userMsg(_),
              ),
              shareIcon()
            ],
          );
        },
      ),
    )
  ]);
}

Container shareIcon() {
  return Container(
      margin: EdgeInsets.only(right: 12.w),
      width: 30.r,
      height: 30.r,
      child: Get.find<StorageService>().isLogin == false
          ? null
          : Image.asset('assets/icons/fenxiang.png'));
}

Padding userMsg(MineController _) {
  return Padding(
    padding: EdgeInsets.only(left: 5.w),
    child: Column(
      children: <Widget>[
        Row(
          children: [
            Text(
              _.userInfoModel?.nickname ?? '',
              style: SeaFont.s16BoldFontTextStyle(color: Colors.white),
              maxLines: 1,
            )
          ],
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
              child: Text(
                'ID${_.userInfoModel?.id ?? ''}',
                style: SeaFont.s12FontTextStyle(color: Colors.white),
                maxLines: 1,
              ),
            )
          ],
        ),
        Row(
          children: <Widget>[
            SizedBox(
                width: 19.r,
                height: 19.r,
                child: Image.asset('assets/icons/qiandao.png')),
            Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(203, 156, 37, 0.5),
                  borderRadius: BorderRadius.all(Radius.circular(16 / 2)),
                ),
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 2, bottom: 2),
                margin: EdgeInsets.only(left: 15.w, right: 15.w),
                child: Text(
                  '签到酒滴:${_.userInfoModel?.jiuValue() ?? ''}',
                  style: SeaFont.s12FontTextStyle(color: Colors.white),
                )),
            Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(203, 156, 37, 0.5),
                  borderRadius: BorderRadius.all(Radius.circular(16 / 2)),
                ),
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 2, bottom: 2),
                child: Text(
                  '已换BCC:${_.userInfoModel?.bccValue() ?? ''}',
                  maxLines: 1,
                  style: SeaFont.s12FontTextStyle(color: Colors.white),
                )),
          ],
        )
      ],
    ),
  );
}

Container userIcon(MineController _) {
  return Container(
      margin: EdgeInsets.only(left: 12.w),
      child: _.userInfoModel == null || _.userInfoModel!.avatar!.isEmpty
          ? Container(
              margin: EdgeInsets.only(right: 12.w),
              width: 66.r,
              height: 66.r,
              child: Image.asset('assets/icons/morentouxiang.png'))
          : AppNetworkImage(
              imageUrl: _.userInfoModel!.avatar!,
              width: 66.r,
              height: 66.r,
              radius: 33.r,
            ));
}
