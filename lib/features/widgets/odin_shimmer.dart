import '/library.dart';

class OdinShimmer extends StatelessWidget {
  const OdinShimmer({
    super.key,
    required this.height,
    required this.width,
    this.type = OdinShimmerType.rectangle,
  });
  final double height;
  final double width;
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

enum OdinShimmerType {
  circle,
  rectangle,
}
