// ignore_for_file: avoid_dynamic_calls

import 'package:odin_cloth_wear/library.dart';

/// A [StatelessWidget] that displays the contact info of the admin.
class ContactInfoForDrawer extends StatelessWidget {
  /// A [StatelessWidget] that displays the contact info of the admin.
  const ContactInfoForDrawer({required this.assets, super.key});

  /// The [Assets] to display.
  final Assets assets;

  List<Widget> get _socials {
    final socials = <Widget>[];
    for (final social in assets.social.entries) {
      socials.add(
        InkWell(
          onTap: () => launchURL(social.value[1] as String),
          child: OdinImageNetwork(
            source: social.value[0] as String,
            width: 26,
            height: 26,
            fit: BoxFit.contain,
            color: ColorConstants.primaryColor,
          ),
        ),
      );
    }

    return socials;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => context.pushNamed(
              Routes.contactRoot,
              extra: PrivateConstants.aboutUs,
            ),
            child: const OdinText(
              text: 'We are ODIN',
              type: OdinTextType.subtitle,
            ),
          ),
          const Gap(),
          InkWell(
            onTap: () => context.pushNamed(
              Routes.contactRoot,
              extra: PrivateConstants.deliveryPolicy,
            ),
            child: const OdinText(
              text: 'Delivery and returns policy',
              type: OdinTextType.subtitle,
            ),
          ),
          const Gap(),
          InkWell(
            onTap: () => context.pushNamed(
              Routes.contactRoot,
              extra: PrivateConstants.privacyPolicy,
            ),
            child: const OdinText(
              text: 'Privacy policy',
              type: OdinTextType.subtitle,
            ),
          ),
          const Gap(),
          InkWell(
            onTap: () => context.pushNamed(
              Routes.contactRoot,
              extra: PrivateConstants.termsAndConditions,
            ),
            child: const OdinText(
              text: 'Terms and conditions',
              type: OdinTextType.subtitle,
            ),
          ),
          const Gap(),
          const Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OdinText(
                text: 'Social Media',
                type: OdinTextType.subtitle,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: OdinDivider(
                  thickness: 2,
                ),
              ),
            ],
          ),
          const Gap(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _socials,
          ),
        ],
      ),
    );
  }
}

/// A [StatelessWidget] that displays a gap.
class Gap extends StatelessWidget {
  /// A [StatelessWidget] that displays a gap.
  const Gap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
    );
  }
}
