import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AppRefreshView extends StatelessWidget {
  final RefreshController controller;
  final VoidCallback? onRefresh;
  final VoidCallback? onLoading;
  final Widget? child;
  final bool? enablePullUp;

  const AppRefreshView(
      {required this.controller,
      this.child,
      this.onLoading,
      this.onRefresh,
      this.enablePullUp,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: enablePullUp ?? false,
      // header: const WaterDropHeader(),
      // footer: CustomFooter(
      //   builder: (BuildContext context, LoadStatus? mode) {
      //     Widget body;
      //     if (mode == LoadStatus.idle) {
      //       body = Text("上拉加载");
      //     } else if (mode == LoadStatus.loading) {
      //       body = CupertinoActivityIndicator();
      //     } else if (mode == LoadStatus.failed) {
      //       body = Text("加载失败！点击重试！");
      //     } else if (mode == LoadStatus.canLoading) {
      //       body = Text("松手,加载更多!");
      //     } else {
      //       body = Text("没有更多数据了!");
      //     }
      //     return SizedBox(
      //       height: 55.0,
      //       child: body,
      //     );
      //   },
      // ),
      controller: controller,
      onRefresh: onRefresh,
      onLoading: onLoading,
      child: child,
    );
  }
}
