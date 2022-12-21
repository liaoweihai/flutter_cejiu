import 'package:flutter_cejiu/app/controller/base/base_refresh_controller.dart';
import 'package:flutter_cejiu/app/data/model/market_buy_order_list_model.dart';
import 'package:flutter_cejiu/app/data/model/market_daily_price_model.dart';
import 'package:flutter_cejiu/app/data/model/user_assets_model.dart';
import 'package:flutter_cejiu/app/data/provider/api.dart';
import 'package:flutter_cejiu/app/data/provider/api_response.dart';
import 'package:get/get.dart';

class MarketController extends BaseRefreshController {
  UserAssetsModel? assetsModel;
  MarketDailyPriceModel? marketDailyPriceModel;

  @override
  get perPage => 5;

  @override
  void onInit() {
    super.onInit();
    print('market===onInit');
  }

  @override
  void onReady() {
    super.onReady();
    print('market===onReady');
  }

  @override
  void onResumed() {
    print('market===onResumed');
  }

  @override
  void onPaused() {
    print('market===onPaused');
  }

  @override
  void onInactive() {
    print('market===onInactive');
  }

  @override
  void onDetached() {
    print('market===onDetached');
  }

  @override
  onRefresh() async {
    page = 1;
    await marketBuyOrderList();
    await getUserAssets();
    await marketDailyPriceMarketDailyPriceModel();
  }

  @override
  onLoading() async {
    page++;
    await marketBuyOrderList();
  }

  Future getUserAssets() async {
    ApiResponse response = await AppApiClient().marketAssets();
    if (response.status == ApiStatus.apiSuccess) {
      assetsModel = UserAssetsModel.fromJson(response.modelMap!);
      update(['assets']);
    }
    return response;
  }

  Future marketDailyPriceMarketDailyPriceModel() async {
    ApiResponse response = await AppApiClient().marketDailyPrice();
    if (response.status == ApiStatus.apiSuccess) {
      marketDailyPriceModel =
          MarketDailyPriceModel.fromJson(response.modelMap!);
      update(['dailyPrice']);
    }
    change('', status: RxStatus.success());

    return response;
  }

  Future marketBuyOrderList() async {
    ApiResponse response = await AppApiClient()
        .marketBuyOrderList(paramas: {'page': page, 'per_page': perPage});
    if (response.status == ApiStatus.apiSuccess) {
      if (page == 1) {
        listDataArray = [];
      }
      total = response.modelMap!['total'];
      List list = response.modelMap!['rs'];
      listDataArray
          .addAll(list.map((e) => MarketBuyOrderListModel.fromJson(e)));

      update(['buyOrderList']);
    }
    setRefreshState();

    return response;
  }
}
