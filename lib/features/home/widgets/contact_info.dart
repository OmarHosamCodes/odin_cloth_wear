// ignore_for_file: avoid_dynamic_calls

import 'package:odin_cloth_wear/library.dart';

/// A [StatelessWidget] that displays the contact info of the admin.
class ContactInfo extends StatelessWidget {
  /// A [StatelessWidget] that displays the contact info of the admin.
  const ContactInfo({required this.adminAssets, super.key});

  /// The [AdminAssets] to display.
  final AdminAssets adminAssets;

  List<Widget> get _socials {
    final socials = <Widget>[];

    adminAssets.social.forEach(
      (key, value) {
        socials.add(
          InkWell(
            onTap: () => launchURL(value[1] as String),
            child: OdinImageNetwork(
              source: value[0] as String,
              width: 26,
              height: 26,
              fit: BoxFit.contain,
              color: ColorConstants.primaryColor,
            ),
          ),
        );
      },
    );
    return socials;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * .2, vertical: 16),
      color: ColorConstants.seccoundaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const OdinText(
            text: 'Contact',
            type: OdinTextType.custom,
            textSize: 20,
            textColor: ColorConstants.primaryColor,
            textWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 10,
          ),
          const OdinText(
            text: 'We are ODIN',
            type: OdinTextType.subtitle,
          ),
          const SizedBox(
            height: 10,
          ),
          const OdinText(
            text: 'Delivery and returns policy',
            type: OdinTextType.subtitle,
          ),
          const SizedBox(
            height: 10,
          ),
          const OdinText(
            text: 'Privacy policy',
            type: OdinTextType.subtitle,
          ),
          const SizedBox(
            height: 10,
          ),
          const OdinText(
            text: 'Terms and conditions',
            type: OdinTextType.subtitle,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: width * .2,
                child: const OdinDivider(
                  thickness: 2,
                ),
              ),
              const OdinText(
                text: 'Social Media',
                type: OdinTextType.subtitle,
              ),
              SizedBox(
                width: width * .2,
                child: const OdinDivider(
                  thickness: 2,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
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
