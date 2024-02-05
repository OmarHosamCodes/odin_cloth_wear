import '/library.dart';

class Description extends StatelessWidget {
  const Description({
    super.key,
    required this.item,
  });
  final Item item;
  @override
  Widget build(BuildContext context) {
    return OdinText(
      text: item.description!,
      type: OdinTextType.custom,
      textColor: ColorConstants.cardColor,
      textSize: 14,
      textWeight: FontWeight.w400,
    );
  }
}
