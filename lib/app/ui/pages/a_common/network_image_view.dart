import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_soon/app/ui/pages/a_common/app_loading.dart';

class AppNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? size;
  const AppNetworkImage({required this.imageUrl, double? errorSize, Key? key})
      : size = errorSize ?? 100,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) => const AppLoadingView(),
        errorWidget: (context, url, error) => Icon(
              Icons.broken_image,
              size: size,
              color: Colors.grey[300],
            ));
  }
}
