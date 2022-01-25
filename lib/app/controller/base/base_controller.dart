import 'package:flutter_soon/app/ui/pages/a_common/app_loading.dart';
import 'package:flutter_soon/app/ui/pages/a_common/error_notwork_view.dart';
import 'package:get/get.dart';

class BaseController extends GetxController with StateMixin {
  final AppLoadingView loadingView = const AppLoadingView();
  late final ErrorNetWorkView netWorkView;

  @override
  void onInit() {
    netWorkView = ErrorNetWorkView(refresh: () {
      errorRefresh();
    });
    super.onInit();
  }

  errorRefresh() {}
}
