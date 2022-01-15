import 'package:flutter_soon/app/controller/tabbar/tabbar_controller.dart';
import 'package:flutter_soon/app/data/provider/api.dart';
import 'package:flutter_soon/app/data/repository/tabbar_repository.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TabBarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabBarController>(() => TabBarController(
        TabBarRepository(AppApiClient(httpClient: http.Client()))));
  }
}
