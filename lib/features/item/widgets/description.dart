import 'package:odin_cloth_wear/library.dart';

/// A [StatelessWidget] that displays the item description.
class Description extends StatelessWidget {
  /// A [StatelessWidget] that displays the item description.
  const Description({
    required this.item,
    super.key,
  });

  /// The [Item] to display.
  final Item item;
  @override
  Widget build(BuildContext context) {
    return OdinText(
      text: item.description!,
      type: OdinTextType.custom,
      textColor: ColorConstants.seccoundaryColor,
      textSize: 14,
      textWeight: FontWeight.w400,
    );
  }
}
