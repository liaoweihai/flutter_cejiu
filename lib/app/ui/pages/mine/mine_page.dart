import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_soon/app/controller/mine/mine_controller.dart';
import 'package:flutter_soon/app/controller/tabbar/tabbar_controller.dart';
import 'package:flutter_soon/app/data/provider/api.dart';
import 'package:flutter_soon/app/data/repository/mine_repository.dart';
import 'package:flutter_soon/app/ui/theme/app_text_util.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MineView();
  }
}

class MineView extends GetView<MineController> {
  MineView({Key? key}) : super(key: key);
  final mineController = Get.put<MineController>(MineController());
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('我的 build  了饿了乐乐乐');
    }
    return MineCustomScrollView();
  }
}

class MineCustomScrollView extends StatelessWidget {
  MineCustomScrollView({
    Key? key,
  }) : super(key: key);

  final List<ListTile> mineList = [
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

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        backgroundColor: Colors.transparent,
        pinned: false,
        // snap: true,
        // floating: true,
        elevation: 0, //隐藏底部阴影分割线
        expandedHeight: 156.h,
        flexibleSpace: mineBarStack(),
      ),
      SliverList(
          delegate: SliverChildListDelegate(ListTile.divideTiles(
                  context: context, tiles: mineList, color: Colors.grey[200])
              .toList()))
    ]);
  }
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
      child: Row(
        // direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(left: 12.w),
              width: 66.r,
              height: 66.r,
              child: Image.asset('assets/icons/morentouxiang.png')),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 5.w),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        '设计师',
                        style:
                            SeaFont.s16BoldFontTextStyle(color: Colors.white),
                        maxLines: 1,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
                        child: Text(
                          'ID123456',
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(16 / 2)),
                          ),
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 2, bottom: 2),
                          margin: EdgeInsets.only(left: 15.w, right: 15.w),
                          child: Text(
                            '签到酒滴:20',
                            style:
                                SeaFont.s12FontTextStyle(color: Colors.white),
                          )),
                      Container(
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(203, 156, 37, 0.5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16 / 2)),
                          ),
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 2, bottom: 2),
                          child: Text(
                            '已换Bcc:20',
                            style:
                                SeaFont.s12FontTextStyle(color: Colors.white),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(right: 12.w),
              width: 30.r,
              height: 30.r,
              child: Image.asset('assets/icons/fenxiang.png'))
        ],
      ),
    )
  ]);
}
