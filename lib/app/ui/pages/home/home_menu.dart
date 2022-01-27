import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_cejiu/app/controller/home/home_controller.dart';
import 'package:get/get.dart';

class HomeMenuView extends GetView<HomeController> {
  final String? icon;
  final String? title;
  final String? subTitle;
  final Function? tapCall;

  const HomeMenuView(
      {this.icon, this.title, this.subTitle, this.tapCall, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        tapCall!();
      },
      child: Container(
        width: ((1.sw - 12 * 4) / 3),
        height: 72.h,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(icon ?? ''), fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title ?? '',
              style: const TextStyle(color: Colors.black87, fontSize: 15),
            ),
            // Text(
            //   subTitle ?? '',
            //   style: const TextStyle(color: Colors.grey, fontSize: 10),
            // )
          ],
        ),
      ),
    );
  }
}
