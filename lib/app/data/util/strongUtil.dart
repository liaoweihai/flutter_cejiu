import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

// 本地存储
class StrongUtil {
  StrongUtil._internal();
  static final StrongUtil _instance = StrongUtil._internal();

  factory StrongUtil() {
    return _instance;
  }

  SharedPreferences? prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    print('获取到缓存单例对象 $prefs');
  }

  Future<bool> setJSON(String key, dynamic jsonVal) {
    String jsonString = jsonEncode(jsonVal);
    return prefs!.setString(key, jsonString);
  }

  dynamic getJSON(String key) {
    String? jsonString = prefs?.getString(key);
    return jsonString == null ? null : jsonDecode(jsonString);
  }

  Future<bool> setBool(String key, bool val) {
    return prefs!.setBool(key, val);
  }

  bool? getBool(String key) {
    return prefs!.getBool(key);
  }

  Future<bool> setString(String key, String val) {
    return prefs!.setString(key, val);
  }

  String? getString(String key) {
    return prefs!.getString(key);
  }

  Future<bool> remove(String key) {
    return prefs!.remove(key);
  }
}
