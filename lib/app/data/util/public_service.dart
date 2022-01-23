import 'package:flutter_soon/app/data/model/api_dict_model.dart';
import 'package:flutter_soon/app/data/provider/api.dart';
import 'package:flutter_soon/app/data/provider/api_response.dart';
import 'package:get/get.dart';

class PublicService extends GetxService {
  ApiDictModel? apiDict;

  Future getApiDict() async {
    ApiResponse response = await AppApiClient().apiDict();
    if (response.status == ApiStatus.apiSuccess) {
      apiDict = ApiDictModel.fromJson(response.modelMap!);
    }
    return response;
  }

  Future<PublicService> init() async {
    return this;
  }
}
