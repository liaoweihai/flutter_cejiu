import 'package:decimal/decimal.dart';
import 'package:flutter_soon/app/controller/base/base_refresh_controller.dart';
import 'package:flutter_soon/app/data/model/shoping_cart_model.dart';
import 'package:flutter_soon/app/data/provider/api.dart';
import 'package:flutter_soon/app/data/provider/api_response.dart';
import 'package:flutter_soon/app/data/repository/shoping_cart_repository.dart';
import 'package:flutter_soon/app/data/util/app_toast.dart';
import 'package:get/get.dart';
import 'package:tobias/tobias.dart' as tobias;

class ShopingCartController extends BaseRefreshController {
  final ShopingCartRepository repository = ShopingCartRepository();

  final _sumPrice = '0'.obs;
  get sumPrice => _sumPrice.value;
  set sumPrice(value) => _sumPrice.value = value;

  final _ifAllSele = false.obs;
  get ifAllSele => _ifAllSele.value;
  set ifAllSele(value) {
    _ifAllSele.value = value;
  }

  @override
  get perPage => 5;

  @override
  void onInit() {
    super.onInit();
    print('ShopingCar===onInit');
  }

  @override
  onRefresh() async {
    page = 1;
    allSeleTap(false);
    await shoppingCartList();

    change('', status: RxStatus.success());
  }

  allSeleTap(bool all) {
    ifAllSele = all;
    for (var element in listDataArray) {
      element.ifSele = all;
    }
    update(['shopingCartList']);
    updatePrice();
  }

  updateList(ShopingCartModel model) {
    model.ifSele = !model.ifSele!;
    ifAllSele = listDataArray.every((element) => element.ifSele!);
    update(['shopingCartList']);
    updatePrice();
  }

  updatePrice() {
    double sum = 0;
    for (ShopingCartModel element in listDataArray) {
      if (element.ifSele!) {
        sum += double.parse(element.price ?? '0') * element.number!.toDouble();
      }
    }
    sumPrice = Decimal.parse(sum.toString()).round(scale: 2).toString();
  }

  @override
  onLoading() async {
    page++;
    await shoppingCartList();
  }

  Future shoppingCartList() async {
    ApiResponse response = await AppApiClient().shoppingCartList();
    if (response.status == ApiStatus.apiSuccess) {
      listDataArray = [];
      List list = response.arrayModel!;
      listDataArray.addAll(list.map((e) => ShopingCartModel.fromJson(e)));
      update(['shopingCartList']);
    }
    setRefreshState();
    return response;
  }

  Future<bool> deleShopingCart(ShopingCartModel? model) async {
    if (model == null) {
      return false;
    }
    ApiResponse response = await AppApiClient().delCart(model.id.toString());
    if (response.status == ApiStatus.apiSuccess) {
      AppToast.publicToast("删除成功");
      return true;
    }
    return false;
  }

  cartConfirm() async {
    List seleCats = listDataArray
        .where((element) => element.ifSele)
        .map((e) => e.id)
        .toList();
    if (seleCats.isEmpty) {
      AppToast.publicToast("无选择结算商品");
      return;
    }
    // //检测是否安装支付宝
    // var result = await tobias.isAliPayInstalled();

    // if (!result) {
    //   return AppToast.publicToast("请先安装支付宝");
    // }

    String yourOrder = '';
    print(seleCats);
    String cartIds = seleCats.join(',');
    print(cartIds);
    String addressId = '78';

    ApiResponse response = await AppApiClient()
        .cartConfirm(paramas: {'cart_ids': cartIds, 'address_id': addressId});

    // if (result) {
    //去支付
    //orderInfo为后台返回的orderInfo
    // var payResult = await tobias.aliPay(yourOrder);

    // if (payResult['result'] != null) {
    //   if (payResult['resultStatus'] == 9000) {
    //     AppToast.publicToast("支付宝支付成功");
    //   } else {
    //     AppToast.publicToast("支付宝支付失败");
    //   }
    // }
    // }
  }
}
