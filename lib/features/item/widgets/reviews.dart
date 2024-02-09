import 'package:odin_cloth_wear/library.dart';

/// A [StatelessWidget] that displays the item reviews.
class Reviews extends StatelessWidget {
  /// A [StatelessWidget] that displays the item reviews.
  const Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.seccoundaryColor,
      width: double.infinity,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OdinText(
            text: 'Reviews',
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 150,
              vertical: 10,
            ),
            child: OdinDivider(),
          ),
        ],
      ),
    );
  }
}
