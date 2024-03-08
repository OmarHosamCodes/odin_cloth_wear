import 'package:odin_cloth_wear/library.dart';
import 'package:shimmer/shimmer.dart';

/// A widget that displays a shimmer effect.
class OdinLoader extends StatelessWidget {
  /// Creates a [OdinLoader] widget.
  const OdinLoader({
    this.height = 1000,
    this.width = 1000,
    super.key,
  });

  /// The height of the shimmer container.
  final double height;

  /// The width of the shimmer container.
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Shimmer.fromColors(
          baseColor: ColorConstants.primaryColor,
          highlightColor: const Color(0xFFE0E0E0),
          child: Container(
            color: ColorConstants.primaryColor,
          ),
        ),
      ),
    );
  }
}
