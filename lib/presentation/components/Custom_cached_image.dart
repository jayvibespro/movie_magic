import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/utils/constants/colors.dart';
import '../../core/utils/custom_cache_manager.dart';

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
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      cacheManager: CustomCacheManager.instance,
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
    );
  }
}
