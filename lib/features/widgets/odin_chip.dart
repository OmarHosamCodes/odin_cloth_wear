import '/library.dart';

class OdinChip extends StatelessWidget {
  const OdinChip({super.key, required this.label});
  final Widget label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: ColorConstants.backgroundColor.withOpacity(.3),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const OdinImageAsset(
              source: 'assets/images/wrapBackgroundBright.png',
              fit: BoxFit.fill,
            ),
            label,
          ],
        ),
      ),
    );
  }
}
