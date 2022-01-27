import 'dart:convert';

import 'package:flutter_cejiu/app/data/provider/api.dart';
import 'package:flutter_cejiu/app/data/provider/api_response.dart';
import 'package:flutter_cejiu/app/data/provider/http_request.dart';
import 'package:flutter_cejiu/app/data/util/storage_service.dart';
import 'package:flutter_cejiu/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRegistController extends GetxController {
  final _mobile = ''.obs;
  set mobile(value) => _mobile.value = value;
  get mobile => _mobile.value;

  final _password = ''.obs;
  set password(value) => _password.value = value;
  get password => _password.value;

  login() async {
    ApiResponse response = await AppApiClient()
        .login(paramas: {'mobile': mobile, 'password': password});
    if (response.status == ApiStatus.apiSuccess) {
      String authorization = response.modelMap?['Authorization'];

      Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
      SharedPreferences prefs = await _prefs;
      Future ifYes = prefs.setString("Authorization", authorization);
      print('保存token === $authorization  ===${ifYes.toString()}');

      Get.find<StorageService>().authorization = authorization;
      //去首页 返回
      Get.back();
      // Get.offAllNamed(Routes.tabBar);
    }
  }
}
