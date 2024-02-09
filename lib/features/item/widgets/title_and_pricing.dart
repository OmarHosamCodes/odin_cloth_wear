import 'package:odin_cloth_wear/library.dart';

/// A [StatelessWidget] that displays the item title and pricing.
class TitleAndPricing extends StatelessWidget {
  /// A [StatelessWidget] that displays the item title and pricing.
  const TitleAndPricing({required this.item, super.key});

  /// The [Item] to display.
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OdinText(
          text: item.name!,
          type: OdinTextType.custom,
          textColor: ColorConstants.seccoundaryColor,
          textSize: 18,
          textWeight: FontWeight.w700,
        ),
        OdinText(
          text: item.category!,
          type: OdinTextType.custom,
          textColor: ColorConstants.seccoundaryColor,
          textSize: 12,
          textWeight: FontWeight.w900,
        ),
        OdinText(
          text: '${item.price} EGP',
          type: OdinTextType.custom,
          textColor: ColorConstants.seccoundaryColor,
          textSize: 14,
          textWeight: FontWeight.w700,
        ),
      ],
    );
  }
}
