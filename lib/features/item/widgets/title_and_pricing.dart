import '/library.dart';

class TitleAndPricing extends StatelessWidget {
  const TitleAndPricing({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OdinText(
          text: item.name!,
          type: OdinTextType.custom,
          textColor: ColorConstants.cardColor,
          textSize: 18,
          textWeight: FontWeight.w700,
        ),
        OdinText(
          text: item.category!,
          type: OdinTextType.custom,
          textColor: ColorConstants.chipColor,
          textSize: 12,
          textWeight: FontWeight.w900,
        ),
        OdinText(
          text: '${item.price} EGP',
          type: OdinTextType.custom,
          textColor: ColorConstants.cardColor,
          textSize: 14,
          textWeight: FontWeight.w700,
        ),
      ],
    );
  }
}
