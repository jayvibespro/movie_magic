import 'package:flutter/material.dart';

import 'custom_image_cache_widget.dart';

class CustomCachedImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;

  const CustomCachedImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    /*CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      cacheManager: CustomCacheManager.instance,
      useOldImageOnUrlChange: true,
      placeholder:
          (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey[700]!,
            highlightColor: Colors.grey[500]!,
            child: Container(width: width, height: height, color: Colors.white),
          ),
      errorWidget:
          (context, url, error) => Container(
            color: Colors.grey.shade700,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeroIcon(
                  HeroIcons.informationCircle,
                  color: Colors.black,
                  size: 26,
                ),
                Text(
                  "Unable to load image",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: cGrey, fontSize: 12),
                ),
              ],
            ),
          ),
      fit: BoxFit.cover,
    );*/
    return CustomImageCacheWidget(
      imageUrl: imageUrl,
      width: width,
      height: height,
    );
  }
}
