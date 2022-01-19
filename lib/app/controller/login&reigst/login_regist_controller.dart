import 'dart:convert';

import 'package:flutter_soon/app/data/provider/api.dart';
import 'package:flutter_soon/app/data/provider/http_request.dart';
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
    final response = await AppApiClient()
        .login(paramas: {'mobile': mobile, 'password': password});
    final responseObj = jsonDecode(response);
    String authorization = responseObj['Authorization'];
    ApiRequest().authorization = authorization;

    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    SharedPreferences prefs = await _prefs;
    Future ifYes = prefs.setString("Authorization", authorization);

    print('保存token === $authorization  ===${ifYes.toString()}');
  }
}
