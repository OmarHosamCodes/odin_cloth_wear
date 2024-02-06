import 'package:odin_cloth_wear/features/home/provider.dart';

import '/library.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key, required this.adminAssets});
  final AdminAssets adminAssets;

  List<Widget> get _socials {
    List<Widget> socials = [];

    adminAssets.social.forEach(
      (key, value) {
        socials.add(
          InkWell(
            onTap: () => launchURL(value[1]),
            child: OdinImageNetwork(
              source: value[0],
              width: 26,
              height: 26,
              fit: BoxFit.contain,
              color: ColorConstants.backgroundColor,
            ),
          ),
        );
      },
    );
    return socials;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: ColorConstants.cardColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const OdinText(
              text: 'Contact',
              type: OdinTextType.custom,
              textSize: 20,
              textColor: ColorConstants.backgroundColor,
              textWeight: FontWeight.bold),
          const ExpansionTile(
            tilePadding: EdgeInsets.all(0),
            collapsedShape: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorConstants.backgroundColor,
                width: .25,
              ),
            ),
            shape: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorConstants.backgroundColor,
                width: .25,
              ),
            ),
            childrenPadding: EdgeInsets.symmetric(horizontal: 16),
            expandedAlignment: Alignment.centerLeft,
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            title: OdinText(
              text: "We Are Odin.",
            ),
            children: [
              ListTile(
                title: OdinText(
                  text: "Obout Us",
                  type: OdinTextType.title,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _socials,
          ),
        ],
      ),
    );
  }
}
