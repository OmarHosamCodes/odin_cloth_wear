import 'package:odin_cloth_wear/library.dart';

/// A [OdinChip] Custom Widget.
class OdinChip extends StatelessWidget {
  /// A [OdinChip] Custom Widget.
  const OdinChip({
    required this.label,
    super.key,
    this.onTap,
  });

  /// The [Widget] to display.
  final Widget label;

  /// The [Function] to display.
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(
          color: ColorConstants.seccoundaryColor,
        ),
      ),
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: ColorConstants.seccoundaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(
            color: ColorConstants.seccoundaryColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 7,
          ),
          child: label,
        ),
      ),
    );
  }
}
