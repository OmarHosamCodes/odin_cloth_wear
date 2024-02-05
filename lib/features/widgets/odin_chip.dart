import '/library.dart';

class OdinChip extends StatelessWidget {
  const OdinChip({
    super.key,
    required this.label,
    this.onTap,
  });
  final Widget label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(
          color: ColorConstants.cardColor,
          width: 1,
        ),
      ),
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: ColorConstants.chipColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(
            color: ColorConstants.cardColor,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 7,
          ),
          child: label,
        ),
      ),
    );
  }
}
