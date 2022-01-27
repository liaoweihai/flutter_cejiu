import 'package:flutter_cejiu/app/controller/base/base_refresh_controller.dart';
import 'package:flutter_cejiu/app/data/model/shoing_detail_model.dart';
import 'package:flutter_cejiu/app/data/provider/api.dart';
import 'package:flutter_cejiu/app/data/provider/api_response.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class ShopingDetailController extends BaseRefreshController {
  ShopingDetailModel? detialModel;

  @override
  void onInit() {
    super.onInit();

    print('ShopingDetailController===onInit');
  }

  @override
  void onReady() {
    super.onReady();
    print('ShopingDetailController===onReady');
  }

  @override
  void onResumed() {
    print('ShopingDetailController===onResumed');
  }

  @override
  void onPaused() {
    print('ShopingDetailController===onPaused');
  }

  @override
  void onInactive() {
    print('ShopingDetailController===onInactive');
  }

  @override
  void onDetached() {
    print('ShopingDetailController===onDetached');
  }

  @override
  onRefresh() async {
    await getGoodsDetail();
  }

  Future getGoodsDetail() async {
    ApiResponse response = await AppApiClient().getGoodsDetail(Get.arguments);
    if (response.status == ApiStatus.apiSuccess) {
      detialModel = ShopingDetailModel.fromJson(response.modelMap!);
      change('', status: RxStatus.success());
    } else {
      change('', status: RxStatus.error(response.apiError?.error.toString()));
    }
    setRefreshState();
    return response;
  }
}
