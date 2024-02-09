import 'package:odin_cloth_wear/library.dart';

/// A [StatelessWidget] that displays a [ColorPicker].
class ColorPicker extends StatelessWidget {
  /// A [StatelessWidget] that displays a [ColorPicker].
  const ColorPicker({required this.item, super.key});

  /// The [Item] to display.
  final Item item;

  @override
  Widget build(BuildContext context) {
    // ignore: inference_failure_on_function_return_type
    late final colors =
        // ignore: inference_failure_on_function_invocation
        item.colors!.map((color) => int.tryParse(color.toString())).toList();

    return Consumer(
      builder: (_, WidgetRef ref, __) {
        ref.watch(colorPickerProvider);
        final selectedColor =
            ref.read(colorPickerProvider).pickedState ?? colors.first;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          ? Color(selectedColor!)
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Color(color!),
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
