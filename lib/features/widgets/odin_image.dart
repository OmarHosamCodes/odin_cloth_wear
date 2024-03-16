import 'package:odin_cloth_wear/library.dart';

/// A widget that displays an image from a network source using caching.
/// If the image fails to load, it displays a fallback icon.
class OdinImage extends StatelessWidget {
  /// A widget that displays an image from a network source using caching.
  const OdinImage({
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
        color: ColorConstants.primaryColor,
      ),
      progressIndicatorBuilder: (context, url, progress) => const Center(
        child: OdinLoader(),
      ),
      width: width,
      height: height,
      fit: fit,
      color: color,
    );
  }
}
