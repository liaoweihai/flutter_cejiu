import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_soon/app/data/model/api_dict_model.dart';
import 'package:flutter_soon/app/data/util/public_service.dart';
import 'package:flutter_soon/app/ui/pages/a_common/app_loading.dart';
import 'package:get/get.dart';

class AppNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final Color? bgColor;
  final double? radius;
  final double? height;

  final double? topLeftRadius;
  final double? topRightRadius;
  final double? bottomLeftRadius;
  final double? bottomRightRadius;

  const AppNetworkImage(
      {required this.imageUrl,
      this.bgColor,
      this.width,
      this.height,
      this.radius,
      this.topLeftRadius,
      this.topRightRadius,
      this.bottomLeftRadius,
      this.bottomRightRadius,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? br = bottomRightRadius;
    double? bl = bottomLeftRadius;
    double? tr = topRightRadius;
    double? tl = topLeftRadius;

    if (radius != null) {
      br = radius;
      bl = radius;
      tr = radius;
      tl = radius;
    }

    BorderRadius? b = BorderRadius.only(
        bottomRight: br != null ? Radius.circular(br) : Radius.zero,
        bottomLeft: bl != null ? Radius.circular(bl) : Radius.zero,
        topLeft: tl != null ? Radius.circular(tl) : Radius.zero,
        topRight: tr != null ? Radius.circular(tr) : Radius.zero);
    if (br == null && bl == null && tr == null && tl == null) {
      b = null;
    }
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
          imageBuilder: (context, imageProvider) => Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: b,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          placeholder: (context, url) => const AppLoadingView(),
          errorWidget: (context, url, error) => Icon(
                Icons.broken_image,
                size: height ?? width,
                color: Colors.grey[300],
              ));
    });
  }
}
