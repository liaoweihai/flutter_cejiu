import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_soon/app/controller/home/home_controller.dart';
import 'package:flutter_soon/app/data/provider/api.dart';
import 'package:flutter_soon/app/data/repository/home_repository.dart';
import 'package:flutter_soon/app/ui/pages/home/home_menu.dart';
import 'package:flutter_soon/app/ui/pages/home/home_shoping_view.dart';
import 'package:flutter_soon/app/ui/theme/app_colors_util.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return HomeView();
  }
}

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final homeController = Get.put<HomeController>(
      HomeController(HomeRepository(apiClient: AppApiClient.getApiClient())));
  final List<Widget> menuList = [
    const HomeMenuView(
      icon: 'assets/images/m1.png',
      title: '现金商城',
      subTitle: '招牌美食6折起',
    ),
    const HomeMenuView(
      icon: 'assets/images/m2.png',
      title: '积分商城',
      subTitle: '招牌美食6折起',
    ),
    const HomeMenuView(
      icon: 'assets/images/m3.png',
      title: 'BCC商城',
      subTitle: '招牌美食6折起',
    )
  ];
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('主页 state build');
    }

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.white,
        elevation: 0, //隐藏底部阴影分割线
        title: const HomeBar(),
      ),
      backgroundColor: ColorsUtil.hexColor('#f5f5f5'),
      body: newCustomScrollView(menuList),
    );
  }
}

CustomScrollView newCustomScrollView(List<Widget> menuList) {
  return CustomScrollView(
    slivers: <Widget>[
      SliverToBoxAdapter(
          child: Column(children: <Widget>[
        SizedBox(
            height: 181.h,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  "assets/images/lbt.png",
                  fit: BoxFit.fill,
                );
              },
              itemCount: 3,
              pagination: const SwiperPagination(),
            )),
        Container(
          margin: const EdgeInsets.only(top: 12, bottom: 12),
          padding: const EdgeInsets.only(right: 12, left: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: menuList,
          ),
        )
      ])),
      SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 169 / 282,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return OrderView(index, tapCall: () {
              Get.find<HomeController>().pushShopingDetail(index.toString());
            });
          },
          childCount: 20,
        ),
      ),
    ],
  );
}

class HomeBar extends StatelessWidget {
  const HomeBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // margin: EdgeInsets.only(top: 40),
          padding:
              const EdgeInsets.only(top: 0, bottom: 10, left: 15, right: 15),
          child: Container(
            height: 35.0,
            decoration: BoxDecoration(
                color: ColorsUtil.hexColor('#F2F2F2'),
                // border: Border.all(width: 1, color: Colors.red),
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search,
                  color: ColorsUtil.hexColor('#999999'),
                ),
                Text('搜索',
                    style: TextStyle(
                        fontSize: 12, color: ColorsUtil.hexColor('#999999'))),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
