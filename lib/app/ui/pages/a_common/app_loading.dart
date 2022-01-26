import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_soon/app/ui/theme/app_colors_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppLoadingView extends StatelessWidget {
  final double? size;
  const AppLoadingView({this.size, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFadingFour(
        color: ColorsUtil.mainColor,
        size: size ?? 60.r,
      ),
    );
  }
}
