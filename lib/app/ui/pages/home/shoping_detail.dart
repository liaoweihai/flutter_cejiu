import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_soon/app/controller/home/shoping_deatil_controller.dart';
import 'package:flutter_soon/app/ui/theme/app_colors_util.dart';
import 'package:flutter_soon/app/ui/theme/app_text_util.dart';
import 'package:get/get.dart';

class ShopingDetailPage extends StatefulWidget {
  const ShopingDetailPage({Key? key}) : super(key: key);

  @override
  _ShopingDetailState createState() => _ShopingDetailState();
}

class _ShopingDetailState extends State<ShopingDetailPage> {
  @override
  Widget build(BuildContext context) {
    print('详情页面=============context===object$context');
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: SafeArea(
        child: Container(
          color: Colors.white,
          width: 1.sw,
          height: 56.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(
                    Icons.store,
                    color: Colors.grey,
                    size: 20,
                  ),
                  Text(
                    '商城',
                    style: SeaFont.s12FontTextStyle(),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(
                    Icons.shopping_cart,
                    color: Colors.grey,
                    size: 20,
                  ),
                  Text(
                    '购物车',
                    style: SeaFont.s12FontTextStyle(),
                  )
                ],
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text('发起团购',
                    style: SeaFont.s14FontTextStyle(
                      color: ColorsUtil.mainColor,
                    )),
                style: ButtonStyle(
                    side: MaterialStateProperty.all(
                        BorderSide(color: ColorsUtil.mainColor))),
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text('加入购物车',
                    style: SeaFont.s14FontTextStyle(
                      color: ColorsUtil.mainColor,
                    )),
                style: ButtonStyle(
                    side: MaterialStateProperty.all(
                        BorderSide(color: ColorsUtil.mainColor))),
              ),
              OutlinedButton(
                  onPressed: () {},
                  child: Text('立即购买',
                      style: SeaFont.s14FontTextStyle(
                        color: Colors.white,
                      )),
                  style: ButtonStyle(
                      side: MaterialStateProperty.all(
                          BorderSide(color: ColorsUtil.mainColor)),
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => ColorsUtil.mainColor))),
            ],
          ),
        ),
      ),
      body: const ShopingDetailView(),
    );
  }
}

class ShopingDetailView extends GetView<ShopingDetailController> {
  const ShopingDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          // iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          pinned: true,
          elevation: 0,
          // title: Text(
          //   '香水粉色邂逅柔情淡香',
          //   style: SeaFont.s15BoldFontTextStyle(),
          // ),
          expandedHeight: 250.0,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.only(bottom: 0),
            background: SizedBox(
              width: 1.sw,
              child: Image.asset(
                'assets/images/lake.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        shopingDetailInfo(),
        addressRuleSelectionView(),
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return SizedBox(
              width: 1.sw,
              child: Image.asset(
                'assets/images/lake.jpg',
                fit: BoxFit.fill,
              ),
            );
          }, childCount: 5),
        ),
      ],
    );
  }
}

Widget addressRuleSelectionView() {
  return SliverToBoxAdapter(
      child: Column(
    children: <Widget>[
      Container(
        color: Colors.grey[100],
        height: 15,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
                width: 50,
                child: Text(
                  '选择',
                  style: SeaFont.s14BoldFontTextStyle(),
                )),
            Expanded(child: Text('规格名称', style: SeaFont.s13FontTextStyle())),
            const Icon(
              Icons.arrow_forward_ios,
              size: 12,
            )
          ],
        ),
      ),
      Padding(
        padding:
            const EdgeInsets.only(left: 12, right: 12, top: 15, bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
                width: 50,
                child: Text(
                  '送至',
                  style: SeaFont.s14BoldFontTextStyle(),
                )),
            Expanded(child: Text('选择地址', style: SeaFont.s13FontTextStyle())),
            const Icon(
              Icons.arrow_forward_ios,
              size: 12,
            )
          ],
        ),
      ),
      Container(
        width: 1.sw,
        color: Colors.grey[100],
        padding: const EdgeInsets.all(12),
        child: Text('-商品详情-',
            textAlign: TextAlign.center, style: SeaFont.s13FontTextStyle()),
      )
    ],
  ));
}

Widget shopingDetailInfo() {
  return SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('香水粉色邂逅柔情淡香', style: SeaFont.s18BoldFontTextStyle()),
          const SizedBox(
            height: 5,
          ),
          Text('贡献值: 8.88', style: SeaFont.s13FontTextStyle()),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: <Widget>[
              Text(
                'BCC',
                style: SeaFont.s16BoldFontTextStyle(color: Colors.redAccent),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '88.88',
                style: SeaFont.s16FontTextStyle(color: Colors.redAccent),
              )
            ],
          )
        ],
      ),
    ),
  );
}
