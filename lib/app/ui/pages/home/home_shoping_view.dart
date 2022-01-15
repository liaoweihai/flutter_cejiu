import 'package:flutter/material.dart';
import 'package:flutter_soon/app/ui/theme/app_colors_util.dart';

class OrderView extends StatefulWidget {
  final int idx;
  final Function? tapCall;

  const OrderView(this.idx, {Key? key, this.tapCall}) : super(key: key);
  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  @override
  Widget build(BuildContext context) {
    double left = 12;
    double right = 12;

    String imgUrlString = 'assets/images/z${widget.idx % 3 + 1}.png';

    if (widget.idx % 2 == 0) {
      right = 0;
    }
    return Container(
      margin: EdgeInsets.only(left: left, right: right, top: 0, bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
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
                child: Image(
                  image: AssetImage(imgUrlString),
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.only(bottom: 0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        child: const Text(
                          '商品标题商品标题商品标题商品标题商品标题商品标题商品标题商品标题商品标题商品标题商品标题商品标题商品标题商品标题商品标题商品标题商品标题商品标题商品标题商品标题商品标题',
                          maxLines: 2,
                          style: TextStyle(fontSize: 13, color: Colors.black87),
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
                              child: const Text(
                                '贡献值8.88',
                                textAlign: TextAlign.left,
                                style: TextStyle(
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
                            children: const <Widget>[
                              Text(
                                '¥88.88',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                "销量:  12345",
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
