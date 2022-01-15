import 'package:flutter_soon/app/data/repository/home_repository.dart';
import 'package:get/get.dart';

class ShopingDetailController extends GetxController {
  final HomeRepository repository;
  ShopingDetailController(this.repository);

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}
