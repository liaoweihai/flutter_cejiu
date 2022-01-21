import 'package:flutter_soon/app/controller/base/base_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BaseRefreshController extends BaseController {
  int total = 1;
  int page = 1;
  List listDataArray = [];
  int _perPage = 15;
  get perPage => _perPage;
  set perPage(p) => _perPage = p;

  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  void onRefresh() async {}

  void onLoading() async {}

  void setRefreshState() {
    if (total > listDataArray.length) {
      if (page == 1) {
        refreshController.refreshCompleted();
        refreshController.resetNoData();
      } else {
        refreshController.loadComplete();
      }
    } else {
      if (page == 1) {
        refreshController.refreshCompleted();
      } else {
        refreshController.loadComplete();
      }
      refreshController.loadNoData();
    }
  }
}
