import 'package:flutter_soon/app/data/provider/http_request.dart';

class AppApiClient {
  // static _instance，_instance会在编译期被初始化，保证了只被创建一次
  static final AppApiClient _instance = AppApiClient._internal();

  //提供了一个工厂方法来获取该类的实例
  factory AppApiClient() {
    return _instance;
  }

  // 通过私有方法_internal()隐藏了构造方法，防止被误创建
  AppApiClient._internal() {
    // 初始化
    init();
  }
  // Singleton._internal(); // 不需要初始化
  void init() {
    // print("这里初始化");
  }

  Future login({Map<String, dynamic>? paramas}) =>
      ApiRequest().postRequest('/login', params: paramas);
  Future apiDict({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('/dict', params: paramas);
}
