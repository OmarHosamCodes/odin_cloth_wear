import 'package:odin_cloth_wear/library.dart';

/// A [StatelessWidget] that displays a [ColorPicker].
class ColorPicker extends ConsumerStatefulWidget {
  /// A [StatelessWidget] that displays a [ColorPicker].
  const ColorPicker({required this.item, super.key});

  /// The [Item] to display.
  final Item item;

  @override
  ConsumerState<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends ConsumerState<ColorPicker> {
  @override
  void initState() {
    super.initState();
    Future(() => ref.read(colorPickerProvider.notifier).reset());
  }

  /// The [Item] colors.
  List<int?> get colors {
    final colors = <int?>[];

    for (final color in widget.item.colors!) {
      colors.add(int.tryParse(color.toString()));
    }
    return colors;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        final selectedColor = ref.watch(
          colorPickerProvider.select((value) => value.pickedState),
        );
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (final color in colors)
              GestureDetector(
                onTap: () {
                  ref
                      .read(colorPickerProvider.notifier)
                      .select(color, widget.item.id!);
                },
                child: AnimatedContainer(
                  margin: const EdgeInsets.only(top: 10),
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: color == selectedColor
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
              ),
          ],
        );
      },
    );
  }
}
