import '/library.dart';

class OdinDivider extends StatelessWidget {
  const OdinDivider({
    super.key,
    this.thickness = 3,
  });
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
