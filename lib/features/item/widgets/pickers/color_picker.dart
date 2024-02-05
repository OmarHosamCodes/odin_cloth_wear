import '/library.dart';

class ColorPicker extends StatelessWidget {
  const ColorPicker({super.key, required this.item});
  final Item item;

  @override
  Widget build(BuildContext context) {
    late final List colors = item.colors!.map((e) => int.tryParse(e)).toList();

    return Consumer(
      builder: (_, WidgetRef ref, __) {
        ref.watch(colorPickerProvider);
        final selectedColor = ref.read(colorPickerProvider).pickedState;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: colors.map(
            (color) {
              final isSelected = color == selectedColor;
              return GestureDetector(
                onTap: () {
                  ref.read(colorPickerProvider.notifier).select(color);
                },
                child: AnimatedContainer(
                  margin: const EdgeInsets.only(top: 10),
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected
                          ? Color(selectedColor)
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Color(color),
                      shape: BoxShape.circle,
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
