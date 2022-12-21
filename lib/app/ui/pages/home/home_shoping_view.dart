import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_cejiu/app/data/model/home_goods_model.dart';
import 'package:flutter_cejiu/app/ui/pages/a_common/network_image_view.dart';
import 'package:flutter_cejiu/app/ui/theme/app_colors_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderView extends StatelessWidget {
  final int idx;
  final Function? tapCall;
  final HomeGoodsModel? model;
  final int type;
  const OrderView(this.idx,
      {Key? key, required this.type, this.tapCall, this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('object =======left');
    // print(model!.left);
    // print('object =======left');
    // print('object =======right');
    // print(model!.right);
    // print('object =======right');
    return Container(
      // margin: EdgeInsets.only(left: model!.left ?? 0, right: model!.right ?? 0),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(8),
        color: Colors.white,
      ),
      child: GestureDetector(
          onTap: () {
            tapCall!();
          },
          child: crearContentView()),
    );
  }

  Column crearContentView() {
    return Column(
      children: [
        // AppNetworkImage(
        //   topLeftRadius: 8,
        //   topRightRadius: 8,
        //   height: 200,
        //   imageUrl: model?.image?.first,
        // ),
        Image.asset(
          'assets/images/pic${model?.suffix}.jpg',
          fit: BoxFit.fill,
        ),
        Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.only(bottom: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  // constraints: const BoxConstraints(minHeight: 30),
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    model?.name ?? '',
                    maxLines: 2,
                    style: const TextStyle(fontSize: 13, color: Colors.black87),
                  ),
                ),
                type == 1
                    ? Row(
                        children: <Widget>[
                          Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: ColorsUtil.hexColor('#FFB702'),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                '贡献值${model?.cv}',
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.white,
                                ),
                              )),
                        ],
                      )
                    : const SizedBox(
                        height: 0,
                      ),
                Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          type == 3
                              ? 'BCC${model?.bcc}'
                              : type == 2
                                  ? '积分${model?.cv}'
                                  : '¥${model?.price}',
                          style: TextStyle(
                            fontSize: type == 1 ? 18 : 14,
                            color: Colors.red[600],
                          ),
                        ),
                        Text(
                          "销量:  ${model?.sold}",
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ))
              ],
            ))
      ],
    );
  }
}
