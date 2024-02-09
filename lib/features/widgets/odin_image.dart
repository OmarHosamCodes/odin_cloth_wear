import 'package:odin_cloth_wear/library.dart';

/// A widget that displays an SVG image from a network source.
/// If the image fails to load, it displays a fallback icon.
class OdinImageSVG extends StatelessWidget {
  /// A widget that displays an SVG image from a network source.
  const OdinImageSVG({
    required this.source,
    super.key,
    this.width,
    this.height,
    this.fallbackIcon = EvaIcons.alertTriangleOutline,
  });

  /// The network URL of the SVG image.
  final String? source;

  /// The width of the image.
  final double? width;

  /// The height of the image.
  final double? height;

  /// The fallback icon to display if the image fails to load.
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
    );
  }
}

/// A widget that displays an image from a network source using caching.
/// If the image fails to load, it displays a fallback icon.
class OdinImageNetwork extends StatelessWidget {
  /// A widget that displays an image from a network source using caching.
  const OdinImageNetwork({
    super.key,
    this.source,
    this.width,
    this.height,
    this.fallbackIcon = EvaIcons.alertTriangleOutline,
    this.fit,
    this.color,
  });

  /// The network URL of the image.
  final String? source;

  /// The width of the image.
  final double? width;

  /// The height of the image.
  final double? height;

  /// The fallback icon to display if the image fails to load.
  final IconData? fallbackIcon;

  /// The fit of the image within its container.
  final BoxFit? fit;

  /// The color to apply to the image.
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

/// A widget that displays an image from an asset source.
/// If the image fails to load, it displays a fallback icon.
class OdinImageAsset extends StatelessWidget {
  /// A widget that displays an image from an asset source.
  const OdinImageAsset({
    super.key,
    this.source,
    this.width,
    this.height,
    this.fallbackIcon = EvaIcons.alertTriangleOutline,
    this.fit,
  });

  /// The asset path of the image.
  final String? source;

  /// The width of the image.
  final double? width;

  /// The height of the image.
  final double? height;

  /// The fallback icon to display if the image fails to load.
  final IconData? fallbackIcon;

  /// The fit of the image within its container.
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
