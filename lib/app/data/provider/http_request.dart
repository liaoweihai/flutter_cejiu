import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';

// import 'package:connectivity_plus/connectivity_plus.dart';

const apiBaseUrl = 'http://cejiu-api-test.fjlssy.cn';
//测试http://cejiu-api-test.fjlssy.cn 正式http://cejiu-api.fjlssy.cn
const secret = 'CJ!%37S1'; //测试CJ!%37S1 正式UJ!%3%DN

class ApiRequest {
  // static _instance，_instance会在编译期被初始化，保证了只被创建一次
  static final ApiRequest _instance = ApiRequest._internal();
  static late final Dio _dio;

  String? _authorization;
  set authorization(value) => _authorization = value;
  get authorization => _authorization;

  //提供了一个工厂方法来获取该类的实例
  factory ApiRequest() {
    return _instance;
  }

  // 通过私有方法_internal()隐藏了构造方法，防止被误创建
  ApiRequest._internal() {
    // or new Dio with a BaseOptions instance.
    BaseOptions options = BaseOptions(
        baseUrl: apiBaseUrl,
        connectTimeout: 15000,
        receiveTimeout: 13000,
        // responseType: ResponseType.json,
        contentType: Headers.jsonContentType);

    // 初始化
    _dio = Dio(options);

    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      ///拦截添加全局头部认证
      // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象,如`handler.reject(error)`，
      // 这样请求将被中止并触发异常，上层catchError会被调用。
      Map<String, dynamic> params = options.data;
      if (params.isEmpty) {
        params = options.queryParameters;
      }
      options.headers = authorizationHeader(params);
      return handler.next(options); //continue
    }, onResponse: (response, handler) {
      // 如果你想终止请求并触发一个错误,你可以 reject 一个`DioError`对象,如`handler.reject(error)`，
      // 这样请求将被中止并触发异常，上层catchError会被调用。
      return handler.next(response); // continue
    }, onError: (DioError e, handler) {
      // 如果你想完成请求并返回一些自定义数据，可以resolve 一个`Response`,如`handler.resolve(response)`。
      // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
      // ConnectivityResult connectivityResult =
      //     await (Connectivity().checkConnectivity());
      // if (connectivityResult == ConnectivityResult.none) {
      //   publicToast('当前网络不可用，请检查您的网络');
      // } else {
      publicToast(errorEventTipString(e));
      // }
      return handler.next(e); //continue
    }));
    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(responseBody: false)); //开启请求日志
    }

    init();
  }
  // Singleton._internal(); // 不需要初始化
  void init() {
    // print("这里初始化");
  }

  // 添加认证
  Map<String, dynamic>? authorizationHeader(Map<String, dynamic>? params) {
    Map<String, dynamic> headers = {};

    String dateStr = (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString();
    String sig = getSig(params: params, time: dateStr);
    headers['sign'] = sig;
    headers['time'] = dateStr;
    headers['Authorization'] = authorization;

    return headers;
  }

// GET
  Future getRequest(
    String path, {
    Map<String, dynamic>? params,
    bool? showLoding,
  }) async {
    try {
      Response response = await _dio.get(path, queryParameters: params);
      deBugLog(response.data.toString());
      return response.data;
    } catch (e) {
      deBugLog(e.toString());
    }
  }

// POST
  Future postRequest(
    String path, {
    Map<String, dynamic>? params,
    bool? showLoding,
  }) async {
    try {
      Response response = await _dio.post(path, data: params);
      deBugLog(response.data.toString());
      return response.data;
    } catch (e) {
      deBugLog(e.toString());
    }
  }
}

// 签名--------------------↓
String getSig({Map<String, dynamic>? params, String? time}) {
  String pStr = params == null ? '' : params.toString();
  pStr = pStr
      .replaceAll(':', '=')
      .replaceAll('{', '')
      .replaceAll('}', '')
      .replaceAll(',', '|')
      .replaceAll(' ', '');

  return md5ParamsStrSort(pStr, time);
}

String md5ParamsStrSort(String paramsStr, String? time) {
  String ts = (paramsStr.isEmpty) ? 'time=$time' : '|time=$time';
  String pstr = paramsStr + ts;
  List strList = pstr.split('|');
  strList.sort();
  deBugLog('签名====$strList');
  pstr = strList.join(':') + secret;
  deBugLog('签名源数据====$pstr');
  var digest = md5.convert(const Utf8Encoder().convert(pstr));
  pstr = hex.encode(digest.bytes);
  deBugLog('签名====$pstr');
  return pstr;
}
// 签名--------------------↑

deBugLog(dynamic msg) {
  if (kDebugMode) {
    print(msg);
  }
}

String errorEventTipString(DioError error) {
  switch (error.type) {
    case DioErrorType.cancel:
      {
        return "请求取消";
      }
    case DioErrorType.connectTimeout:
      {
        return "连接超时";
      }
    case DioErrorType.sendTimeout:
      {
        return "请求超时";
      }
    case DioErrorType.receiveTimeout:
      {
        return "响应超时";
      }
    case DioErrorType.response:
      {
        try {
          int? errCode = error.response!.statusCode;
          switch (errCode) {
            case 400:
              {
                return "请求语法错误";
              }
            case 401:
              {
                return "没有权限";
              }
            case 403:
              {
                return "服务器拒绝执行";
              }
            case 404:
              {
                return "无法连接服务器";
              }
            case 405:
              {
                return "请求方法被禁止";
              }
            case 500:
              {
                return "服务器内部错误";
              }
            case 502:
              {
                return "无效的请求";
              }
            case 503:
              {
                return "服务器挂了";
              }
            case 505:
              {
                return "不支持HTTP协议请求";
              }
            default:
              {
                return error.response!.statusMessage!;
              }
          }
        } on Exception catch (_) {
          return "未知错误";
        }
      }
    default:
      {
        return error.error.message;
      }
  }
}

void publicToast(msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
