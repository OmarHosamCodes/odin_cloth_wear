import 'package:odin_cloth_wear/library.dart';

/// A [StatelessWidget] that displays the sizes of an [Item].
class SizePicker extends StatelessWidget {
  /// A [StatelessWidget] that displays the sizes of an [Item].
  const SizePicker({required this.item, super.key});

  /// The [Item] to display.
  final Item item;
  @override
  Widget build(BuildContext context) {
    late final sizes = item.sizes!.map((e) => e).toList();
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        ref.watch(sizePickerProvider);
        final selectedSize =
            ref.read(sizePickerProvider).pickedState ?? item.sizes!.first;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: sizes.map(
            (size) {
              final isSelected = size == selectedSize;
              return GestureDetector(
                onTap: () {
                  ref.read(sizePickerProvider.notifier).select(size);
                },
                child: AnimatedContainer(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.only(top: 10),
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? ColorConstants.seccoundaryColor
                        : Colors.transparent,
                    border: Border.all(
                      color: isSelected
                          ? ColorConstants.seccoundaryColor
                          : ColorConstants.seccoundaryColor.withOpacity(0.1),
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: OdinText(
                      text: size as String,
                      type: OdinTextType.custom,
                      textColor: isSelected
                          ? ColorConstants.primaryColor
                          : ColorConstants.seccoundaryColor,
                      textSize: 14,
                      textWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                ),
              );
            },
          ).toList(),
        );
      },
    );
  }
}
