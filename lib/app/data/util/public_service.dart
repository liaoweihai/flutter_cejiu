import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_cejiu/app/data/model/api_dict_model.dart';
import 'package:flutter_cejiu/app/data/provider/api.dart';
import 'package:flutter_cejiu/app/data/provider/api_response.dart';
import 'package:flutter_cejiu/app/data/provider/http_request.dart';
import 'package:get/get.dart';

class PublicService extends GetxService {
  final _apiDict = ApiDictModel().obs;
  get apiDict => _apiDict.value;
  set apiDict(a) => _apiDict.value = a;

  final _netWorkStatus = ConnectivityResult.none.obs;
  get netWorkStatus => _netWorkStatus.value;
  set netWorkStatus(a) => _netWorkStatus.value = a;

  final _ifNoNetWorking = true.obs;
  get ifNoNetWorking => _ifNoNetWorking.value;
  set ifNoNetWorking(a) => _ifNoNetWorking.value = a;

  Future getApiDict() async {
    ApiResponse response = await AppApiClient().apiDict();
    if (response.status == ApiStatus.apiSuccess) {
      apiDict = ApiDictModel.fromJson(response.modelMap!);
    }
    return response;
  }

  Future<ApiDictModel?> updateApiDic() async {
    await ThrottleUtil.throttle(() {
      getApiDict();
    });
    return apiDict;
  }

  Future<PublicService> init() async {
    netWorkStatus = await (Connectivity().checkConnectivity());
    ifNoNetWorking = (netWorkStatus == ConnectivityResult.none);
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Got a new connectivity status!
      netWorkStatus = result;
      ifNoNetWorking = (netWorkStatus == ConnectivityResult.none);
      deBugLog('=============网络状态变化$netWorkStatus');
    });
    deBugLog('=============网络状态$netWorkStatus');
    return this;
  }
}

class ThrottleUtil {
  static const deFaultDurationTime = 3000;
  static Timer? timer;

  // 防抖函数
  static debounce(Function doSomething, {durationTime = deFaultDurationTime}) {
    timer?.cancel();
    timer = Timer(Duration(milliseconds: durationTime), () {
      doSomething();
      timer = null;
    });
  }

  // 节流函数
  static const String deFaultThrottleId = 'DeFaultThrottleId';
  static Map<String, int> startTimeMap = {deFaultThrottleId: 0};

  static throttle(Function doSomething,
      {String throttleId = deFaultThrottleId,
      durationTime = deFaultDurationTime,
      Function? continueClick}) {
    int currentTime = DateTime.now().millisecondsSinceEpoch;

    if (currentTime - (startTimeMap[throttleId] ?? 0) > durationTime) {
      doSomething();
      startTimeMap[throttleId] = DateTime.now().millisecondsSinceEpoch;
    } else {
      continueClick != null ? continueClick() : null;
    }
  }
}
