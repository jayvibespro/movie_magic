import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

import '../../core/utils/constants/colors.dart';
import '../../core/utils/custom_image_cache_service.dart';

class CustomImageCacheWidget extends StatefulWidget {
  final String imageUrl;
  final double width;
  final double height;

  const CustomImageCacheWidget({
    Key? key,
    required this.imageUrl,
    this.width = 100,
    this.height = 100,
  }) : super(key: key);

  @override
  _CustomImageCacheWidgetState createState() => _CustomImageCacheWidgetState();
}

class _CustomImageCacheWidgetState extends State<CustomImageCacheWidget> {
  Uint8List? _imageBytes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    try {
      final cachedImage = await CustomImageCacheService.getCachedImage(
        widget.imageUrl,
      );
      if (cachedImage != null) {
        setState(() {
          _imageBytes = cachedImage;
          _isLoading = false;
        });
        return;
      }
      _fetchAndCacheImage();
    } catch (e) {
      if (kDebugMode) {
        print('Error loading cached image: $e');
      }
      setState(() {
        _isLoading = false;
      });
      _fetchAndCacheImage();
    }
  }

  Future<void> _fetchAndCacheImage() async {
    try {
      final response = await http.get(Uri.parse(widget.imageUrl));
      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;
        await CustomImageCacheService.cacheImage(widget.imageUrl, bytes);
        setState(() {
          _imageBytes = bytes;
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? AnimatedOpacity(
          duration: Duration(milliseconds: 300),
          opacity: _isLoading ? 1 : 0,
          child: Shimmer.fromColors(
            baseColor: Colors.grey[700]!,
            highlightColor: Colors.grey[500]!,
            child: Container(
              width: widget.width,
              height: widget.height,
              color: Colors.white,
            ),
          ),
        )
        : _imageBytes != null
        ? AnimatedOpacity(
          duration: Duration(milliseconds: 300),
          opacity: !_isLoading ? 1 : 0,
          child: Image.memory(
            _imageBytes!,
            width: widget.width,
            height: widget.height,
            fit: BoxFit.cover,
          ),
        )
        : AnimatedOpacity(
          duration: Duration(milliseconds: 300),
          opacity: !_isLoading ? 1 : 0,
          child: Container(
            color: Colors.grey.shade700,
            width: widget.width,
            height: widget.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const HeroIcon(
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
        );
  }
}
