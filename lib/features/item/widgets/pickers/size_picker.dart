import '/library.dart';

class SizePicker extends StatelessWidget {
  const SizePicker({super.key, required this.item});

  final Item item;
  @override
  Widget build(BuildContext context) {
    late final List sizes = item.sizes!.map((e) => e).toList();
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        ref.watch(sizePickerProvider);
        final selectedSize = ref.read(sizePickerProvider).pickedState;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                        ? ColorConstants.chipColor
                        : Colors.transparent,
                    border: Border.all(
                      color: isSelected
                          ? ColorConstants.chipColor
                          : ColorConstants.chipColor.withOpacity(0.1),
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: OdinText(
                      text: size,
                      type: OdinTextType.custom,
                      textColor: isSelected
                          ? ColorConstants.titleTextColor
                          : ColorConstants.chipColor,
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
