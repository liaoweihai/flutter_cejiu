import 'package:flutter_soon/app/data/model/home_goods_model.dart';
import 'package:flutter_soon/app/data/provider/api.dart';
import 'package:flutter_soon/app/data/provider/api_response.dart';
import 'package:flutter_soon/app/data/repository/home_repository.dart';
import 'package:flutter_soon/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final HomeRepository repository = HomeRepository();

  List swipers = [];
  List goods = [];
  int total = 1;
  int type = 1;
  int perPage = 15;
  int page = 1;
  int status = 1;

  @override
  void onInit() {
    getSwiperIndex();
    loadGoods();
    super.onInit();
  }

  getSwiperIndex() async {
    ApiResponse response = await AppApiClient().index(paramas: {'type': type});
    if (response.status == ApiStatus.apiSuccess) {
      swipers = response.modelMap!['banner'];
      update(['swipers']);
    }
  }

  loadGoods() async {
    ApiResponse response = await AppApiClient()
        .goods(paramas: {'type': type, 'page': page, 'per_page': perPage});
    if (response.status == ApiStatus.apiSuccess) {
      if (page == 1) {
        goods = [];
      }
      if (total >= goods.length) {
        status = 0;
      }
      total = response.modelMap!['total'];
      List list = response.modelMap!['rs'];
      goods.addAll(list.map((e) => HomeGoodsModel.fromJson(e)));
      update(['goods']);
    }
  }

  pushShopingDetail(Object shoping) {
    Get.toNamed(Routes.shopingDetail);
  }
}
