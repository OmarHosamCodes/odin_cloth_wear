import '/library.dart';

class Reviews extends StatelessWidget {
  const Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.cardColor,
      width: double.infinity,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          OdinText(
            text: 'Reviews',
            type: OdinTextType.title,
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
