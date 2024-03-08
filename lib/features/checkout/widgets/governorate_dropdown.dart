import 'package:odin_cloth_wear/library.dart';

/// [GovernorateDropdown] is a [StatelessWidget]
/// that displays a dropdown for governorates.
class GovernorateDropdown extends ConsumerWidget {
  /// [GovernorateDropdown] constructor
  const GovernorateDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dropdownItems = <DropdownMenuItem<String>>[];
    for (final e in GovernoratesConstants.governorates) {
      dropdownItems.add(
        DropdownMenuItem(
          value: e,
          child: OdinText(
            text: e,
          ),
        ),
      );
    }
    final governorate = ref.watch(
      mailStateNotifierProvider.select((value) => value.governorates),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorConstants.seccoundaryColor.withOpacity(.5),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: ColorConstants.seccoundaryColor,
            ),
          ),
          child: DropdownButton(
            underline: const SizedBox(),
            icon: const Icon(
              EvaIcons.arrowDown,
              color: ColorConstants.primaryColor,
            ),
            padding: const EdgeInsets.only(left: 5, right: 5),
            dropdownColor: ColorConstants.seccoundaryColor,
            isExpanded: true,
            items: dropdownItems,
            onChanged: (value) {
              ref
                  .read(
                    mailStateNotifierProvider.notifier,
                  )
                  .setGovernorate(value.toString());
            },
            hint: OdinText(
              text: governorate,
            ),
          ),
        ),
        Visibility(
          visible: governorate == 'Choose a governorate',
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: OdinText(
              text: 'Please choose a governorate',
              type: OdinTextType.custom,
              textColor: Color(0xFFF44336),
              textSize: 14,
              textWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
