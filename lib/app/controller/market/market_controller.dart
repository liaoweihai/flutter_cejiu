import 'package:flutter_soon/app/data/repository/market_repository.dart';
import 'package:get/get.dart';

class MarketController extends GetxController {
  final MarketRepository repository;
  MarketController(this.repository);

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}
