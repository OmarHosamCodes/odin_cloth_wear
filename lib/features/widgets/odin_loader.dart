import 'package:odin_cloth_wear/library.dart';

/// A widget that displays a loading indicator.
class OdinLoader extends StatelessWidget {
  /// A widget that displays a loading indicator.
  const OdinLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      width: 200,
      child: LinearProgressIndicator(
        borderRadius: BorderRadius.circular(10),
        valueColor: const AlwaysStoppedAnimation<Color>(
          ColorConstants.seccoundaryColor,
        ),
        backgroundColor: ColorConstants.seccoundaryColor.withOpacity(0.2),
      ),
    );
  }
}
