import 'package:odin_cloth_wear/library.dart';

/// A [StatelessWidget] that displays the sizes of an [Item].
class SizePicker extends StatelessWidget {
  /// A [StatelessWidget] that displays the sizes of an [Item].
  const SizePicker({required this.item, super.key});

  /// The [Item] to display.
  final Item item;

  /// The [Item] sizes.
  List<String?> get sizes {
    final sizes = <String?>[];
    for (final size in item.sizes!) {
      sizes.add(size.toString());
    }
    return sizes;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        final selectedSize = ref.watch(
          sizePickerProvider.select(
            (value) {
              if (value.itemID == item.id) {
                return value.pickedState;
              } else {
                return null;
              }
            },
          ),
        );
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (final size in sizes)
              GestureDetector(
                onTap: () {
                  ref
                      .read(sizePickerProvider.notifier)
                      .select(size.toString(), item.id!);
                },
                child: AnimatedContainer(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.only(top: 10),
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: size == selectedSize
                        ? ColorConstants.seccoundaryColor
                        : Colors.transparent,
                    border: Border.all(
                      color: size == selectedSize
                          ? ColorConstants.seccoundaryColor
                          : ColorConstants.seccoundaryColor.withOpacity(0.1),
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: OdinText(
                      text: size.toString(),
                      type: OdinTextType.custom,
                      textColor: size == selectedSize
                          ? ColorConstants.primaryColor
                          : ColorConstants.seccoundaryColor,
                      textSize: 14,
                      textWeight: size == selectedSize
                          ? FontWeight.w600
                          : FontWeight.w400,
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
