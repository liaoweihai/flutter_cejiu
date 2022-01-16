import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_soon/app/controller/home/shoping_deatil_controller.dart';
import 'package:flutter_soon/app/ui/theme/app_text_util.dart';
import 'package:get/get.dart';

class ShopingDetail extends StatefulWidget {
  const ShopingDetail({Key? key}) : super(key: key);

  @override
  _ShopingDetailState createState() => _ShopingDetailState();
}

class _ShopingDetailState extends State<ShopingDetail> {
  @override
  Widget build(BuildContext context) {
    return ShopingDetailPage();
  }
}

class ShopingDetailPage extends GetView<ShopingDetailController> {
  const ShopingDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
              titlePadding: EdgeInsets.only(bottom: 0),
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
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text('List Item $index'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget shopingDetailInfo() {
  return SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          SizedBox(
              width: 1.sw,
              child: Text('香水粉色邂逅柔情淡香', style: SeaFont.s16FontTextStyle())),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: <Widget>[
              Text(
                'BCC',
                style: SeaFont.s16FontTextStyle(color: Colors.redAccent),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '88.88',
                style: SeaFont.s15FontTextStyle(color: Colors.redAccent),
              )
            ],
          )
        ],
      ),
    ),
  );
}
