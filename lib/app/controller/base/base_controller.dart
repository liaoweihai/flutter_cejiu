import 'package:flutter_soon/app/ui/pages/a_common/app_loading.dart';
import 'package:get/get.dart';

class BaseController extends GetxController with StateMixin {
  final AppLoadingView loadingView = const AppLoadingView();
}
