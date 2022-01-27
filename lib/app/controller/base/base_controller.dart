import 'package:flutter/material.dart';
import 'package:flutter_cejiu/app/data/util/app_toast.dart';
import 'package:flutter_cejiu/app/data/util/public_service.dart';
import 'package:flutter_cejiu/app/ui/pages/a_common/app_loading.dart';
import 'package:flutter_cejiu/app/ui/pages/a_common/error_notwork_view.dart';
import 'package:flutter_cejiu/app/ui/pages/a_common/error_request_view.dart';
import 'package:get/get.dart';

class BaseController extends GetxController with StateMixin {
  Widget loadErrorView({String? errorMsg, bool? ifScaffold = false}) {
    return ifScaffold!
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black87,
              title: const Text('加载错误'),
              elevation: 0,
            ),
            body: ErrorRequestView(
                refresh: () {
                  errorRefresh();
                },
                errorMsg: errorMsg))
        : ErrorRequestView(
            refresh: () {
              errorRefresh();
            },
            errorMsg: errorMsg,
          );
  }

  Widget netWorkView({bool? ifScaffold = false}) {
    return ifScaffold!
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black87,
              title: const Text('网络错误'),
              elevation: 0,
            ),
            body: ErrorNetWorkView(refresh: () {
              errorRefresh();
            }))
        : ErrorNetWorkView(refresh: () {
            errorRefresh();
          });
  }

  AppLoadingView loadingView() {
    return const AppLoadingView();
  }

  loadRequestHttp() {}

  errorRefresh() {
    if (Get.find<PublicService>().ifNoNetWorking) {
      AppToast.publicToast('请检查网络');
    } else {
      loadRequestHttp();
    }
  }
}
