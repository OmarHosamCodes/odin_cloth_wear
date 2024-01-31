import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import '/library.dart';

class OdinImageMemory extends StatelessWidget {
  const OdinImageMemory({
    super.key,
    required this.source,
    this.width,
    this.height,
    this.fallbackIcon = EvaIcons.alertTriangleOutline,
    this.fit,
  });
  final String? source;
  final double? width;
  final double? height;
  final IconData? fallbackIcon;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return Image(
      image: MemoryImage(base64Decode(source!)),
      width: width,
      height: height,
      errorBuilder: (context, error, stackTrace) => Icon(
        fallbackIcon,
        color: Colors.white,
      ),
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
      filterQuality: FilterQuality.medium,
      fit: fit,
    );
  }
}

//remove fade
class OdinImageNetwork extends StatelessWidget {
  const OdinImageNetwork({
    super.key,
    this.source,
    this.width,
    this.height,
    this.fallbackIcon = EvaIcons.alertTriangleOutline,
    this.fit,
  });
  final String? source;
  final double? width;
  final double? height;
  final IconData? fallbackIcon;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: source!,
      progressIndicatorBuilder: (context, url, progress) {
        return Center(
          child: CircularProgressIndicator(
            value: progress.progress,
          ),
        );
      },
      errorWidget: (context, url, error) => Icon(
        fallbackIcon,
        color: Colors.white,
      ),
      filterQuality: FilterQuality.medium,
      width: width,
      height: height,
      fit: fit,
    );
  }
}

class OdinImageAsset extends StatelessWidget {
  const OdinImageAsset({
    super.key,
    this.source,
    this.width,
    this.height,
    this.fallbackIcon = EvaIcons.alertTriangleOutline,
    this.fit,
  });
  final String? source;
  final double? width;
  final double? height;
  final IconData? fallbackIcon;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      source!,
      width: width,
      height: height,
      errorBuilder: (context, error, stackTrace) => Icon(
        fallbackIcon,
        color: Colors.white,
      ),
      fit: fit,
    );
  }
}
