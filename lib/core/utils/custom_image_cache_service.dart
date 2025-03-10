import 'dart:typed_data';

import 'package:flutter/services.dart';

import 'custom_cache_manager.dart';

class CustomImageCacheService {
  static final Map<String, Uint8List> _memoryCache = {};

  static Future<Uint8List?> getCachedImage(String url) async {
    if (_memoryCache.containsKey(url)) {
      return _memoryCache[url];
    }
    final file = await CustomCacheManager.instance.getSingleFile(url);
    if (await file.exists()) {
      final bytes = await file.readAsBytes();
      _memoryCache[url] = bytes;
      return bytes;
    }
    return null;
  }

  static Future<void> cacheImage(String url, Uint8List bytes) async {
    _memoryCache[url] = bytes;
    await CustomCacheManager.instance.putFile(url, bytes);
  }
}
