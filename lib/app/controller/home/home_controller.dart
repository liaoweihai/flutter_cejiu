import 'package:flutter_soon/app/data/repository/home_repository.dart';
import 'package:flutter_soon/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final HomeRepository repository;
  HomeController(this.repository);

  // final _obj = ''.obs;
  // set obj(value) => this._obj.value = value;
  // get obj => this._obj.value;
  getAll() {}

  pushShopingDetail(Object shoping) {
    Get.toNamed(Routes.shopingDetail);
  }
}
