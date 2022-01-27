import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_cejiu/app/controller/shopping_cart/shoping_cart_controller.dart';
import 'package:flutter_cejiu/app/data/model/shoping_cart_model.dart';
import 'package:flutter_cejiu/app/ui/pages/a_common/app_smart_refresher.dart';
import 'package:flutter_cejiu/app/ui/pages/a_common/network_image_view.dart';
import 'package:flutter_cejiu/app/ui/theme/app_colors_util.dart';
import 'package:flutter_cejiu/app/ui/theme/app_text_util.dart';
import 'package:get/get.dart';

class ShopingCart extends StatefulWidget {
  const ShopingCart({Key? key}) : super(key: key);

  @override
  _ShopingCartState createState() => _ShopingCartState();
}

class _ShopingCartState extends State<ShopingCart> {
  final shopingCartController =
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
        height: 55,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Obx(() => TextButton.icon(
                onPressed: () {
                  shopingCartController.ifAllSele =
                      !shopingCartController.ifAllSele;
                  shopingCartController
                      .allSeleTap(shopingCartController.ifAllSele);
                },
                icon: Icon(
                  shopingCartController.ifAllSele
                      ? Icons.radio_button_checked
                      : Icons.radio_button_unchecked,
                  color: shopingCartController.ifAllSele
                      ? ColorsUtil.mainColor
                      : Colors.grey[300],
                ),
                label: Text(
                  '全选',
                  style: SeaFont.s14FontTextStyle(),
                ))),
            Expanded(
              child: Obx(() => Text(
                    '合计${Get.find<ShopingCartController>().sumPrice}元',
                    textAlign: TextAlign.right,
                    style: SeaFont.s14FontTextStyle(),
                  )),
            ),
            Container(
                height: 35,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                margin: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    color: ColorsUtil.mainColor,
                    borderRadius: BorderRadius.circular(5)),
                child: TextButton(
                    onPressed: () {
                      Get.find<ShopingCartController>().cartConfirm();
                    },
                    child: Text(
                      '结算',
                      style: SeaFont.s14FontTextStyle(color: Colors.white),
                    )))
          ],
        ),
      ),
      body: const ShopingCartView(),
    );
  }
}

class ShopingCartView extends GetView<ShopingCartController> {
  const ShopingCartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Get.find<ShopingCartController>().obx(
      (state) => SafeArea(
          child: GetBuilder<ShopingCartController>(
        id: 'shopingCartList',
        builder: (_) {
          return AppRefreshView(
            enablePullUp: false,
            pageController: _,
            child: ListView.builder(
                itemCount: _.listDataArray.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = _.listDataArray[index];

                  return Dismissible(
                    key: ValueKey(item),
                    background: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        width: double.infinity,
                        color: Colors.redAccent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('滑动删除',
                                textAlign: TextAlign.right,
                                style: SeaFont.s14FontTextStyle(
                                    color: Colors.white)),
                            Text('滑动删除',
                                textAlign: TextAlign.right,
                                style: SeaFont.s14FontTextStyle(
                                    color: Colors.white))
                          ],
                        )),
                    child: shoppingGoodsItem(item),
                    confirmDismiss: (DismissDirection direction) async {
                      return _.deleShopingCart(item);
                    },
                    onDismissed: (DismissDirection direction) {
                      _.listDataArray.remove(item);
                    },
                  );
                }),
          );
        },
      )),
      onLoading: Get.find<ShopingCartController>().loadingView(),
      onError: (string) => Get.find<ShopingCartController>().netWorkView(),
    );
  }

  GestureDetector shoppingGoodsItem(ShopingCartModel model) {
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
                  Get.find<ShopingCartController>().updateList(model);
                },
                child: SizedBox(
                  width: 45,
                  child: Icon(
                    model.ifSele!
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
                    color:
                        model.ifSele! ? ColorsUtil.mainColor : Colors.grey[300],
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(
                      left: 0, right: 12, top: 10, bottom: 10),
                  width: 90.r,
                  height: 90.r,
                  child: AppNetworkImage(
                    imageUrl: model.image!,
                    radius: 5,
                  )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      model.name ?? '',
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
                        model.itemName ?? '',
                        style: SeaFont.s12FontTextStyle(color: Colors.black54),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '¥ ${model.price}',
                          style: SeaFont.s14BoldFontTextStyle(
                              color: Colors.redAccent),
                        ),
                        Text(
                          'x${model.number}',
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
