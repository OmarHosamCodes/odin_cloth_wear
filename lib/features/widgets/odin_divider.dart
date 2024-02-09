import 'package:odin_cloth_wear/library.dart';

/// A [StatelessWidget] that displays a divider.
class OdinDivider extends StatelessWidget {
  /// A [StatelessWidget] that displays a divider.
  const OdinDivider({
    super.key,
    this.thickness = 3,
  });

  /// The thickness of the divider.
  final double thickness;
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: ColorConstants.dividerColor,
      thickness: thickness,
      height: 3,
    );
  }
}
