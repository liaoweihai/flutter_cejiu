import 'package:flutter_cejiu/app/controller/base/base_refresh_controller.dart';
import 'package:flutter_cejiu/app/data/model/user_info_model.dart';
import 'package:flutter_cejiu/app/data/provider/api.dart';
import 'package:flutter_cejiu/app/data/provider/api_response.dart';

class MineController extends BaseRefreshController {
  UserInfoModel? userInfoModel;

  @override
  void onInit() {
    super.onInit();
    print('MineController===onInit');
  }

  @override
  void onReady() {
    super.onReady();
    print('MineController===onReady');
  }

  @override
  void onResumed() {
    print('MineController===onResumed');
  }

  @override
  void onPaused() {
    print('MineController===onPaused');
  }

  @override
  void onInactive() {
    print('MineController===onInactive');
  }

  @override
  void onDetached() {
    print('MineController===onDetached');
  }

  @override
  onRefresh() async {
    await myUserInfo();
  }

  Future myUserInfo() async {
    ApiResponse response = await AppApiClient().myUserInfo();
    if (response.status == ApiStatus.apiSuccess) {
      userInfoModel = UserInfoModel.fromJson(response.modelMap!);
      update(['myUserInfo']);
    }
    setRefreshState();
    return response;
  }
}
