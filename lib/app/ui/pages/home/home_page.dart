import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_cejiu/app/controller/home/home_controller.dart';
import 'package:flutter_cejiu/app/data/model/api_dict_model.dart';
import 'package:flutter_cejiu/app/data/util/public_service.dart';
import 'package:flutter_cejiu/app/ui/pages/a_common/app_smart_refresher.dart';
import 'package:flutter_cejiu/app/ui/pages/a_common/network_image_view.dart';
import 'package:flutter_cejiu/app/ui/pages/home/home_menu.dart';
import 'package:flutter_cejiu/app/ui/pages/home/home_shoping_view.dart';
import 'package:flutter_cejiu/app/ui/theme/app_colors_util.dart';
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

  final homeController = Get.put<HomeController>(HomeController());
  final List<Widget> menuList = [
    HomeMenuView(
      icon: 'assets/images/m1.png',
      title: '现金商城',
      // subTitle: '招牌美食6折起',
      tapCall: () {
        Get.find<HomeController>().type = 1;
        Get.find<HomeController>().onRefresh();
      },
    ),
    HomeMenuView(
      icon: 'assets/images/m2.png',
      title: '积分商城',
      // subTitle: '招牌美食6折起',
      tapCall: () {
        Get.find<HomeController>().type = 2;
        Get.find<HomeController>().onRefresh();
      },
    ),
    HomeMenuView(
      icon: 'assets/images/m3.png',
      title: 'BCC商城',
      // subTitle: '招牌美食6折起',
      tapCall: () {
        Get.find<HomeController>().type = 3;
        Get.find<HomeController>().onRefresh();
      },
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
        body: homeController.obx(
            (state) => AppRefreshView(
                  pageController: homeController,
                  child: buildHomeListView(menuList),
                ),
            onLoading: homeController.loadingView(),
            onError: (error) => homeController.netWorkView()));
  }
}

CustomScrollView buildHomeListView(List<Widget> menuList) {
  print('我攒机了2222222');
  return CustomScrollView(
    slivers: <Widget>[
      SliverToBoxAdapter(
          child: Column(children: <Widget>[
        SizedBox(height: 220.h, child: buildSwiper()),
        Container(
          margin: const EdgeInsets.only(top: 12, bottom: 12),
          padding: const EdgeInsets.only(right: 12, left: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: menuList,
          ),
        )
      ])),
      buildGridView(),
    ],
  );
}

GetBuilder<HomeController> buildGridView() {
  return GetBuilder<HomeController>(
    id: 'goods',
    builder: (_) {
      return SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: _.type == 1 ? 169 / 282 : 169 / 260,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return OrderView(index, type: _.type, model: _.listDataArray[index],
                tapCall: () {
              Get.find<HomeController>()
                  .pushShopingDetail(_.listDataArray[index].id.toString());
            });
          },
          childCount: _.listDataArray.length,
        ),
      );
    },
  );
}

GetBuilder<HomeController> buildSwiper() {
  return GetBuilder<HomeController>(
    id: 'swipers',
    builder: (_) {
      return Swiper(
        key: UniqueKey(),
        itemBuilder: (BuildContext context, int index) {
          ApiDictModel? apiDict = Get.find<PublicService>().apiDict;
          String imagePrefix = apiDict?.imagePrefix ?? '';
          Map swiper = _.swipers[index];
          return AppNetworkImage(
            imageUrl: imagePrefix + swiper['image'],
          );
        },
        itemCount: _.swipers.length,
        pagination: const SwiperPagination(),
      );
    },
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
