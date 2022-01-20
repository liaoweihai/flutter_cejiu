import 'package:flutter/material.dart';
import 'package:flutter_soon/app/data/model/api_dict_model.dart';
import 'package:flutter_soon/app/data/model/home_goods_model.dart';
import 'package:flutter_soon/app/data/util/public_service.dart';
import 'package:flutter_soon/app/ui/theme/app_colors_util.dart';
import 'package:get/get.dart';

class OrderView extends StatefulWidget {
  final int idx;
  final Function? tapCall;
  final HomeGoodsModel? model;
  const OrderView(this.idx, {Key? key, this.tapCall, this.model})
      : super(key: key);
  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  @override
  Widget build(BuildContext context) {
    double left = 12;
    double right = 12;

    ApiDictModel? apiDict = Get.find<PublicService>().apiDict;
    String imagePrefix = apiDict?.imagePrefix ?? '';
    String img = widget.model?.image?.first;

    String imgUrl = imagePrefix + img;

    // String imgUrlString = 'assets/images/z${widget.idx % 3 + 1}.png';

    if (widget.idx % 2 == 0) {
      right = 0;
    }
    return Container(
      margin: EdgeInsets.only(left: left, right: right, top: 0, bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(8),
        color: Colors.white,
      ),
      // padding: const EdgeInsets.all(8),
      // width: (size.width - 12 * 3) / 2,
      // height: 282,
      child: InkWell(
          onTap: () {
            widget.tapCall!();
          },
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: imagePrefix == null
                    ? const Icon(Icons.no_cell)
                    : Image.network(imgUrl, fit: BoxFit.cover),
              ),
              Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.only(bottom: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        constraints: const BoxConstraints(minHeight: 30),
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          widget.model?.name ?? '',
                          maxLines: 2,
                          style: const TextStyle(
                              fontSize: 13, color: Colors.black87),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: ColorsUtil.hexColor('#FFB702'),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                '贡献值${widget.model?.cv}',
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.white,
                                ),
                              )),
                        ],
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                '¥${widget.model?.price}',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.red[600],
                                ),
                              ),
                              Text(
                                "销量:  ${widget.model?.sold}",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ))
                    ],
                  ))
            ],
          )),
    );
  }
}
