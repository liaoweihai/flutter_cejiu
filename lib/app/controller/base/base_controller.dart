import 'package:flutter_soon/app/ui/pages/a_common/app_loading.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  final RxBool _isLoading = true.obs;
  set isLoading(value) => _isLoading.value = value;
  get isLoading => _isLoading.value;

  final AppLoadingView loadingView = const AppLoadingView();
}
