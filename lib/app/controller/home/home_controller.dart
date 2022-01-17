import 'package:flutter_soon/app/data/repository/home_repository.dart';
import 'package:flutter_soon/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final HomeRepository repository = HomeRepository();
  getAll() {}

  pushShopingDetail(Object shoping) {
    Get.toNamed(Routes.shopingDetail);
  }
}
