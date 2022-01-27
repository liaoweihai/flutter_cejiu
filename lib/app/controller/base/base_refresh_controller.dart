import 'package:flutter_cejiu/app/controller/base/base_controller.dart';
import 'package:flutter_cejiu/app/data/util/app_toast.dart';
import 'package:flutter_cejiu/app/data/util/public_service.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
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

  @override
  errorRefresh() {
    if (Get.find<PublicService>().ifNoNetWorking) {
      AppToast.publicToast('请检查网络');
    } else {
      onRefresh();
    }
  }

  @override
  void onInit() {
    super.onInit();
    if (Get.find<PublicService>().ifNoNetWorking) {
      change('无网络', status: RxStatus.error());
    } else {
      onRefresh();
    }
  }

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
