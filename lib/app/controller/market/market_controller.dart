import 'package:flutter_soon/app/controller/base/base_refresh_controller.dart';
import 'package:flutter_soon/app/data/model/market_buy_order_list_model.dart';
import 'package:flutter_soon/app/data/model/market_daily_price_model.dart';
import 'package:flutter_soon/app/data/model/user_assets_model.dart';
import 'package:flutter_soon/app/data/provider/api.dart';
import 'package:flutter_soon/app/data/provider/api_response.dart';

class MarketController extends BaseRefreshController {
  UserAssetsModel? assetsModel;
  MarketDailyPriceModel? marketDailyPriceModel;

  @override
  void onInit() {
    onRefresh();
    super.onInit();
  }

  @override
  onRefresh() async {
    page = 1;
    await getUserAssets();
    await marketDailyPriceMarketDailyPriceModel();
    await marketBuyOrderList();
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
    return response;
  }

  Future marketBuyOrderList() async {
    ApiResponse response = await AppApiClient()
        .marketBuyOrderList(paramas: {'page': page, 'perPage': perPage});
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
    isLoading = false;
    setRefreshState();

    return response;
  }
}
