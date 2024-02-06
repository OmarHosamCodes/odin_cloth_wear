import 'package:flutter_svg/flutter_svg.dart';

import '/library.dart';

class OdinImageSVG extends StatelessWidget {
  const OdinImageSVG({
    super.key,
    required this.source,
    this.width,
    this.height,
    this.fallbackIcon = EvaIcons.alertTriangleOutline,
  });
  final String? source;
  final double? width;
  final double? height;
  final IconData? fallbackIcon;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      source!,
      width: width,
      height: height,
      placeholderBuilder: (BuildContext context) => Icon(
        fallbackIcon,
        color: Colors.white,
      ),
      fit: BoxFit.contain,
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
    this.color,
  });
  final String? source;
  final double? width;
  final double? height;
  final IconData? fallbackIcon;
  final BoxFit? fit;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: source!,
      errorWidget: (context, url, error) => Icon(
        fallbackIcon,
        color: Colors.white,
      ),
      progressIndicatorBuilder: (context, url, progress) => const Center(
        child: OdinShimmer(
          height: double.maxFinite,
          width: double.maxFinite,
        ),
      ),
      filterQuality: FilterQuality.medium,
      width: width,
      height: height,
      fit: fit,
      color: color,
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
