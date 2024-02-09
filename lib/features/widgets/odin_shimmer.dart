import 'package:odin_cloth_wear/library.dart';

/// A widget that displays a shimmer effect.
///
/// The [OdinShimmer] widget is used to display a shimmer effect,
/// which is a popular loading animation in mobile applications.
/// It can be used to indicate that content is being loaded or to provide
/// a visual feedback during asynchronous operations.
///
/// The shimmer effect is achieved
/// by animating a gradient of colors over a container.
/// The [OdinShimmer] widget wraps a [Container] widget
/// with a [Shimmer.fromColors] widget to create the shimmer effect.
///
/// The [OdinShimmer] widget requires the [height] and [width] parameters
/// to specify the dimensions of the shimmer container.
/// The [type] parameter can be used to specify the shape of the container,
/// either a circle or a rectangle.
///
/// Example usage:
///
/// ```dart
/// OdinShimmer(
///   height: 200,
///   width: 200,
///   type: OdinShimmerType.rectangle,
/// )
/// ```
class OdinShimmer extends StatelessWidget {
  /// Creates a [OdinShimmer] widget.
  ///
  /// The [height] and [width] parameters are required to specify
  /// the dimensions of the shimmer container.
  /// The [type] parameter is optional and defaults to
  /// [OdinShimmerType.rectangle].
  const OdinShimmer({
    required this.height,
    required this.width,
    super.key,
    this.type = OdinShimmerType.rectangle,
  });

  /// The height of the shimmer container.
  final double height;

  /// The width of the shimmer container.
  final double width;

  /// The type of the shimmer container.
  ///
  /// This can be either [OdinShimmerType.circle]
  /// or [OdinShimmerType.rectangle].
  final OdinShimmerType type;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: type == OdinShimmerType.circle
            ? BorderRadius.circular(100)
            : BorderRadius.circular(10),
        child: Shimmer.fromColors(
          baseColor: const Color(0xFFE0E0E0),
          highlightColor: const Color(0xFFF5F5F5),
          child: Container(
            color: const Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}

/// An enumeration of the possible types of [OdinShimmer] containers.
enum OdinShimmerType {
  /// A circular shimmer container.
  circle,

  /// A rectangular shimmer container.
  rectangle,
}
