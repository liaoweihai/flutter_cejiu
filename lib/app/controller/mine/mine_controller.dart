import 'package:flutter_soon/app/data/repository/mine_repository.dart';
import 'package:get/get.dart';

class MineController extends GetxController {
  final MineRepository repository;
  MineController(this.repository);

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}
