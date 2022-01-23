import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_soon/app/data/model/market_buy_order_list_model.dart';
import 'package:flutter_soon/app/ui/pages/a_common/network_image_view.dart';
import 'package:flutter_soon/app/ui/theme/app_colors_util.dart';
import 'package:flutter_soon/app/ui/theme/app_text_util.dart';

class MarketListItem extends StatefulWidget {
  final MarketBuyOrderListModel model;
  const MarketListItem(this.model, {Key? key}) : super(key: key);

  @override
  _MarketListItemState createState() => _MarketListItemState();
}

class _MarketListItemState extends State<MarketListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 12.r,
        right: 12.r,
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
                  width: 40.r,
                  height: 40.r,
                  child: AppNetworkImage(
                    imageUrl: widget.model.avatar!,
                    errorSize: 40.r,
                  )),
              Container(
                  margin: EdgeInsets.only(left: 10.w),
                  child: Text(widget.model.nickname ?? '',
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
                        child: Text(widget.model.totalNum ?? ''))
                  ],
                ),
                Column(
                  children: <Widget>[
                    const Text('单价'),
                    Container(
                        margin: EdgeInsets.only(top: 5.h),
                        child: Text(widget.model.price ?? ''))
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
                      child: Text(widget.model.surplusNum ?? ''))
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  '买入',
                  style: SeaFont.s16FontTextStyle(color: ColorsUtil.mainColor),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.white), //背景颜色
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
}
