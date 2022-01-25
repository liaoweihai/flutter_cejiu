import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_soon/app/ui/theme/app_colors_util.dart';
import 'package:flutter_soon/app/ui/theme/app_text_util.dart';

class ErrorNetWorkView extends StatelessWidget {
  final double? size;

  final Function refresh;
  const ErrorNetWorkView({required this.refresh, double? errorSize, Key? key})
      : size = errorSize ?? 100,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 1.sw,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.wifi_off,
            size: 120.r,
            color: ColorsUtil.mainColor,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            '网络连接错误',
            style: SeaFont.s14FontTextStyle(color: Colors.grey),
          ),
          const SizedBox(
            height: 25,
          ),
          TextButton(
              onPressed: () {
                refresh();
              },
              child: Text('点击刷新',
                  style:
                      SeaFont.s14FontTextStyle(color: ColorsUtil.mainColor))),
        ],
      ),
    );
  }
}
