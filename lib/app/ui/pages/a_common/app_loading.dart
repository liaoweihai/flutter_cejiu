import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_soon/app/ui/theme/app_colors_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppLoadingView extends StatefulWidget {
  const AppLoadingView({Key? key}) : super(key: key);
  @override
  _AppLoadingViewState createState() => _AppLoadingViewState();
}

class _AppLoadingViewState extends State<AppLoadingView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFadingFour(
        color: ColorsUtil.mainColor,
        size: 60.r,
      ),
    );
  }
}
