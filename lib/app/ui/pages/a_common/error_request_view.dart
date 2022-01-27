import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_cejiu/app/ui/theme/app_colors_util.dart';
import 'package:flutter_cejiu/app/ui/theme/app_text_util.dart';

class ErrorRequestView extends StatelessWidget {
  final double? size;
  final String? errorMsg;
  final Function refresh;
  const ErrorRequestView(
      {required this.refresh, this.errorMsg, double? errorSize, Key? key})
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
            Icons.error,
            size: 120.r,
            color: ColorsUtil.mainColor,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            errorMsg ?? '请求错误了,刷新重试',
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
