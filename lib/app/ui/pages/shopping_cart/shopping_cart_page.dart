import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_soon/app/controller/shopping_cart/shoping_cart_controller.dart';
import 'package:flutter_soon/app/data/provider/api.dart';
import 'package:flutter_soon/app/data/repository/shoping_cart_repository.dart';
import 'package:flutter_soon/app/ui/theme/app_colors_util.dart';
import 'package:flutter_soon/app/ui/theme/app_text_util.dart';
import 'package:get/get.dart';

class ShopingCart extends StatefulWidget {
  const ShopingCart({Key? key}) : super(key: key);

  @override
  _ShopingCartState createState() => _ShopingCartState();
}

class _ShopingCartState extends State<ShopingCart> {
  @override
  Widget build(BuildContext context) {
    return ShopingCartView();
  }
}

class ShopingCartView extends GetView<ShopingCartController> {
  ShopingCartView({Key? key}) : super(key: key);
  final mineController =
      Get.put<ShopingCartController>(ShopingCartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            actions: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    '编辑',
                    style: SeaFont.s13FontTextStyle(),
                  ))
            ],
            title: Text(
              '购物车',
              style: SeaFont.sNavTitleStyle(),
            )),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.radio_button_unchecked),
                  label: const Text('全选'))
            ],
          ),
        ),
        body: SafeArea(
            child: ListView.builder(
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  return shoppingGoodsItem();
                })));
  }

  GestureDetector shoppingGoodsItem() {
    return GestureDetector(
      onTap: () {
        print('object点击全部');
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 12, top: 12, right: 12),
        child: Container(
          // height: 113.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  print('object点击原点');
                },
                child: SizedBox(
                  width: 45,
                  child: Icon(
                    Icons.radio_button_unchecked,
                    color: Colors.grey[300],
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 0, right: 12),
                  width: 90.r,
                  height: 90.r,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      'assets/images/pic1Ad.jpg',
                      fit: BoxFit.fill,
                    ),
                  )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '流秋季新品时尚潮流帆布鞋潮流秋季新品时尚潮流帆布',
                      maxLines: 2,
                      style: SeaFont.s14FontTextStyle(),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(3)),
                      margin: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Text(
                        '白色;38码',
                        style: SeaFont.s12FontTextStyle(color: Colors.black54),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '¥ 59.99',
                          style: SeaFont.s14BoldFontTextStyle(
                              color: Colors.redAccent),
                        ),
                        Text(
                          'x1',
                          style: SeaFont.s12FontTextStyle(),
                        )
                      ],
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
