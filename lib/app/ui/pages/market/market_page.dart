import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_soon/app/controller/market/market_controller.dart';
import 'package:flutter_soon/app/ui/pages/market/market_line_chart.dart';
import 'package:flutter_soon/app/ui/pages/market/market_list_item.dart';
import 'package:flutter_soon/app/ui/theme/app_colors_util.dart';
import 'package:flutter_soon/app/ui/theme/app_text_util.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({Key? key}) : super(key: key);

  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MarketView();
  }
}

class MarketView extends GetView<MarketController> {
  MarketView({Key? key}) : super(key: key);

  final marketController = Get.put<MarketController>(MarketController());

  @override
  Widget build(BuildContext context) {
    print('市场 build  了饿了乐乐乐');
    return Scaffold(
        body: Obx(() => Get.find<MarketController>().isLoading
            ? Get.find<MarketController>().loadingView
            : marketContentView()));
  }
}

Widget marketContentView() {
  return Container(
    color: Colors.white,
    child: SmartRefresher(
      enablePullUp: true,
      controller: Get.find<MarketController>().refreshController,
      onRefresh: Get.find<MarketController>().onRefresh,
      onLoading: Get.find<MarketController>().onLoading,
      child: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.transparent,
          pinned: true,
          // snap: true,
          // floating: true,
          elevation: 0, //隐藏底部阴影分割线
          expandedHeight: 206.h,
          title: SizedBox(
            // width: 1.sw,
            child: Text('市场',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
          actions: [
            TextButton.icon(
              onPressed: () {},
              label: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 15,
              ),
              icon: const Text(
                '资产明细',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
          flexibleSpace: barStack(),
        ),
        SliverToBoxAdapter(
          child: GetBuilder<MarketController>(
            id: 'dailyPrice',
            builder: (_) {
              List list = _.marketDailyPriceModel?.list ?? [];
              list = list.map((e) {
                String key = e['date_time'];
                double value = double.parse(e['price'].toString());

                return {'key': key, 'value': value};
              }).toList();
              return MarketLineChart(
                lineDataList: list,
                change: _.marketDailyPriceModel?.change,
                price: _.marketDailyPriceModel?.price,
              );
            },
          ),
        ),
        SliverToBoxAdapter(
          child: marketOrderHeadView(),
        ),
        GetBuilder<MarketController>(
          id: 'buyOrderList',
          builder: (_) {
            return SliverList(
                delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return MarketListItem(_.listDataArray[index]);
              },
              childCount: _.listDataArray.length,
            ));
          },
        )
      ]),
    ),
  );
}

Widget marketOrderHeadView() {
  return Column(
    children: [
      Divider(height: 10, thickness: 10, color: Colors.grey[100]),
      Container(
          width: 1.sw,
          color: Colors.white,
          padding: EdgeInsets.only(left: 12.w, right: 12.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('交易市场', style: SeaFont.s16FontTextStyle()),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(
                        Icons.article,
                        size: 20.w,
                        color: ColorsUtil.mainColor,
                      ),
                      Text('订单', style: SeaFont.s12FontTextStyle())
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 12.w),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.perm_identity,
                          size: 20.w,
                          color: ColorsUtil.mainColor,
                        ),
                        Text('委托', style: SeaFont.s12FontTextStyle())
                      ],
                    ),
                  )
                ],
              )
            ],
          ))
    ],
  );
}

Stack barStack() {
  return Stack(alignment: AlignmentDirectional.topCenter, children: [
    SizedBox(
      // margin: EdgeInsets.all(0),
      width: 1.sw,
      height: 206.h + ScreenUtil().statusBarHeight,
      child: Image.asset(
        'assets/images/shichangbeijing.png',
        fit: BoxFit.fill,
      ),
    ),
    Positioned(
      top: 90.h,
      child: Container(
          margin: EdgeInsets.only(top: 30.h),
          width: 1.sw,
          child: Center(
              child: Text(
            '我的钱包',
            style: SeaFont.s16FontTextStyle(color: Colors.white),
          ))),
    ),
    Positioned(
      width: 1.sw * 0.5,
      top: 90.h + 25.h + ScreenUtil().statusBarHeight,
      child: GetBuilder<MarketController>(
        id: 'assets',
        builder: (_) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: Text('积分',
                        style: SeaFont.s14FontTextStyle(color: Colors.white)),
                  ),
                  Text(_.assetsModel?.cv ?? '',
                      style: SeaFont.s18FontTextStyle(color: Colors.white))
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: Text('BCC',
                        style: SeaFont.s14FontTextStyle(color: Colors.white)),
                  ),
                  Text(_.assetsModel?.bcc ?? '',
                      style: SeaFont.s18FontTextStyle(color: Colors.white))
                ],
              )
            ],
          );
        },
      ),
    )
  ]);
}
