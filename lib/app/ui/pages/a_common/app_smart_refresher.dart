import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_cejiu/app/controller/base/base_refresh_controller.dart';
import 'package:flutter_cejiu/app/ui/pages/a_common/app_loading.dart';
import 'package:flutter_cejiu/app/ui/theme/app_colors_util.dart';
import 'package:flutter_cejiu/app/ui/theme/app_text_util.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AppRefreshView extends StatelessWidget {
  final RefreshController? controller;
  final VoidCallback? onRefresh;
  final VoidCallback? onLoading;
  final Widget? child;
  final bool? enablePullUp;
  final BaseRefreshController? pageController;

  const AppRefreshView(
      {this.controller,
      this.child,
      this.onLoading,
      this.onRefresh,
      this.enablePullUp,
      this.pageController,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: enablePullUp ?? true,
      header: MaterialClassicHeader(
        color: ColorsUtil.mainColor,
        distance: ScreenUtil().statusBarHeight + 20,
      ),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus? mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text(
              "上拉加载",
              style: SeaFont.s14FontTextStyle(),
              textAlign: TextAlign.center,
            );
          } else if (mode == LoadStatus.loading) {
            body = AppLoadingView(
              size: 20.w,
            );
          } else if (mode == LoadStatus.failed) {
            body = Text(
              "加载失败！点击重试！",
              style: SeaFont.s14FontTextStyle(),
              textAlign: TextAlign.center,
            );
          } else if (mode == LoadStatus.canLoading) {
            body = Text(
              "松手,加载更多",
              style: SeaFont.s14FontTextStyle(),
              textAlign: TextAlign.center,
            );
          } else {
            body = Text(
              "-- 没有更多数据了 --",
              style: SeaFont.s14FontTextStyle(),
              textAlign: TextAlign.center,
            );
          }
          return SizedBox(
            height: 55.0,
            child: body,
          );
        },
      ),
      controller: pageController != null
          ? pageController!.refreshController
          : controller!,
      onRefresh: pageController != null ? pageController!.onRefresh : onRefresh,
      onLoading: pageController != null ? pageController!.onLoading : onLoading,
      child: child,
    );
  }
}
