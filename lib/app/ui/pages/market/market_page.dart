import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_soon/app/controller/market/market_controller.dart';
import 'package:flutter_soon/app/data/model/market_buy_order_list_model.dart';
import 'package:flutter_soon/app/ui/pages/a_common/app_smart_refresher.dart';
import 'package:flutter_soon/app/ui/pages/a_common/network_image_view.dart';
import 'package:flutter_soon/app/ui/pages/market/market_line_chart.dart';
import 'package:flutter_soon/app/ui/theme/app_colors_util.dart';
import 'package:flutter_soon/app/ui/theme/app_text_util.dart';
import 'package:get/get.dart';

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
    return Scaffold(body: MarketView());
  }
}

class MarketView extends GetView<MarketController> {
  MarketView({Key? key}) : super(key: key);

  final marketController = Get.put<MarketController>(MarketController());

  @override
  Widget build(BuildContext context) {
    print('市场 build  了饿了乐乐乐');
    return marketController.obx(
      (state) => marketContentView(),
      onLoading: marketController.loadingView,
      onError: (string) => marketController.netWorkView,
    );
  }
}

Widget marketContentView() {
  print('市场 build 22222222');
  return Container(
    color: Colors.white,
    child: AppRefreshView(
      pageController: Get.find<MarketController>(),
      child: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.transparent,
          pinned: true,
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
              return _.marketDailyPriceModel == null
                  ? const Text('重新刷新')
                  : MarketLineChart(
                      lineDataList: _.marketDailyPriceModel!.getLineList(),
                      change: _.marketDailyPriceModel?.change,
                      price: _.marketDailyPriceModel?.price,
                    );
            },
          ),
        ),
        // SliverToBoxAdapter(
        //   child: marketOrderHeadView(),
        // ),
        GetBuilder<MarketController>(
          id: 'buyOrderList',
          builder: (_) {
            return SliverList(
                delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return marketListItem(_.listDataArray[index]);
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

Padding marketListItem(MarketBuyOrderListModel model) {
  return Padding(
    padding: EdgeInsets.only(
      left: 12.r,
      right: 12.r,
    ),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            AppNetworkImage(
              width: 40.r,
              height: 40.r,
              radius: 20.r,
              imageUrl: model.avatar!,
            ),
            Container(
                margin: EdgeInsets.only(left: 10.w),
                child: Text(model.nickname ?? '',
                    style: SeaFont.s15FontTextStyle()))
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 12.h, bottom: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text('总量'),
                  Container(
                      margin: EdgeInsets.only(top: 5.h),
                      child: Text(model.totalNum ?? ''))
                ],
              ),
              Column(
                children: <Widget>[
                  const Text('单价'),
                  Container(
                      margin: EdgeInsets.only(top: 5.h),
                      child: Text(model.price ?? ''))
                ],
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                const Text('剩余'),
                Container(
                    margin: EdgeInsets.only(top: 5.h),
                    child: Text(model.surplusNum ?? ''))
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                '买入',
                style: SeaFont.s16FontTextStyle(color: ColorsUtil.mainColor),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white), //背景颜色
                side: MaterialStateProperty.all(
                    BorderSide(width: 1, color: ColorsUtil.mainColor)), //边框
              ), //圆角弧度
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 12.r, bottom: 12.r),
          child: Divider(
            height: 1,
            thickness: 0.5,
            // indent: 12,
            // endIndent: 12,
            color: Colors.green[100],
          ),
        ),
      ],
    ),
  );
}
