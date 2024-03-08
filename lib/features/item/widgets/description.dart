import 'package:flutter/foundation.dart';
import 'package:odin_cloth_wear/library.dart';

/// Description widget
class Description extends StatelessWidget {
  /// Description widget constructor
  const Description({
    required this.item,
    super.key,
  });

  /// Item
  final Item item;

  /// Description sections
  List<String> get descriptionSections => item.description!.split('/');

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(descriptionSections);
    }

    final sectionWidgets = <Widget>[];
    var index = 0;
    while (index < descriptionSections.length) {
      final section = descriptionSections[index];
      sectionWidgets.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OdinText(
              text: section,
              type: OdinTextType.custom,
              textColor: ColorConstants.seccoundaryColor,
              textSize: 14,
              textWeight: FontWeight.w700,
            ),
            const SizedBox(height: 10),
            const SizedBox(
              width: 40,
              child: OdinDivider(),
            ),
            const SizedBox(height: 10),
          ],
        ),
      );
      index++;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: sectionWidgets,
    );
  }
}
