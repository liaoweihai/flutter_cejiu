import 'package:flutter_soon/app/data/model/shoping_cart_model.dart';
import 'package:flutter_soon/app/data/repository/shoping_cart_repository.dart';
import 'package:get/get.dart';

class ShopingCartController extends GetxController {
  final ShopingCartRepository repository = ShopingCartRepository();

  final List<ShopingCartModel> shopingCarts = [];
}
