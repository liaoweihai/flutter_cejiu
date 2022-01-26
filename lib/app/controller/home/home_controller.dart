import 'package:flutter_soon/app/controller/base/base_refresh_controller.dart';
import 'package:flutter_soon/app/data/model/home_goods_model.dart';
import 'package:flutter_soon/app/data/provider/api.dart';
import 'package:flutter_soon/app/data/provider/api_response.dart';
import 'package:flutter_soon/app/data/repository/home_repository.dart';
import 'package:flutter_soon/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends BaseRefreshController {
  final HomeRepository repository = HomeRepository();

  List swipers = [];
  int type = 1;

  @override
  get perPage => 6;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  onRefresh() async {
    page = 1;

    await getGoods();
    await getSwiperIndex();
  }

  @override
  onLoading() async {
    page++;
    getGoods();
  }

  getSwiperIndex() async {
    ApiResponse response = await AppApiClient().index(paramas: {'type': type});
    if (response.status == ApiStatus.apiSuccess) {
      swipers = response.modelMap!['banner'];
      // update(['swipers']);
    }
    change('', status: RxStatus.success());
  }

  getGoods() async {
    ApiResponse response = await AppApiClient()
        .goods(paramas: {'type': type, 'page': page, 'per_page': perPage});
    if (response.status == ApiStatus.apiSuccess) {
      if (page == 1) {
        listDataArray = [];
      }
      total = response.modelMap!['total'];
      List list = response.modelMap!['rs'];
      listDataArray.addAll(list.map((e) => HomeGoodsModel.fromJson(e)));
      update(['goods']);
    }
    setRefreshState();
  }

  pushShopingDetail(Object shoping) {
    Get.toNamed(Routes.shopingDetail);
  }
}
