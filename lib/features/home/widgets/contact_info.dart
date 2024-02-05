import '/library.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key, required this.adminAssets});
  final AdminAssets adminAssets;

  List<OdinChip> get _chips {
    List<OdinChip> chips = [];

    adminAssets.social.forEach(
      (key, value) {
        chips.add(
          OdinChip(
            label: Row(
              children: [
                OdinImageNetwork(
                  source: value,
                  width: 20,
                  height: 20,
                  fit: BoxFit.contain,
                ),
                OdinText(text: key),
              ],
            ),
          ),
        );
      },
    );
    return chips;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: ColorConstants.cardColor,
      child: Column(
        children: _chips,
      ),
    );
  }
}
