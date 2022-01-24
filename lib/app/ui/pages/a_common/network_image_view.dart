import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_soon/app/data/model/api_dict_model.dart';
import 'package:flutter_soon/app/data/util/public_service.dart';
import 'package:flutter_soon/app/ui/pages/a_common/app_loading.dart';
import 'package:get/get.dart';

class AppNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? size;
  const AppNetworkImage({required this.imageUrl, double? errorSize, Key? key})
      : size = errorSize ?? 100,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      print('啊啊啊啊啊啊啊啊啊 === 我更新了图片路径');
      ApiDictModel? apiDict = Get.find<PublicService>().apiDict;
      if (apiDict == null || apiDict.imagePrefix == null) {
        Get.find<PublicService>().updateApiDic();
      }
      String imagePrefix = apiDict?.imagePrefix ?? '';

      String imgUrl = imageUrl;
      if (!imageUrl.contains(imagePrefix)) {
        imgUrl = imagePrefix + imageUrl;
      }
      return CachedNetworkImage(
          imageUrl: imgUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => const AppLoadingView(),
          errorWidget: (context, url, error) => Icon(
                Icons.broken_image,
                size: size,
                color: Colors.grey[300],
              ));
    });
  }
}
