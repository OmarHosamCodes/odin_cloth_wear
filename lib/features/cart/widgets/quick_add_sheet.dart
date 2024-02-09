import 'package:odin_cloth_wear/library.dart';

/// A [StatelessWidget] that displays the quick add sheet.
void openQuickAddSheet(
  BuildContext context, {
  required Item item,
  required WidgetRef ref,
}) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return QuickAddSheet(
        item: item,
        ref: ref,
      );
    },
  );
}

/// A [StatelessWidget] that displays the quick add sheet.
class QuickAddSheet extends StatelessWidget {
  /// A [StatelessWidget] that displays the quick add sheet.
  const QuickAddSheet({required this.item, required this.ref, super.key});

  /// The [Item] to display.
  final Item item;

  /// The [WidgetRef] to display.
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const OdinText(
            text: 'Quick Add',
            type: OdinTextType.custom,
            textSize: 16,
            textWeight: FontWeight.bold,
            textColor: ColorConstants.seccoundaryColor,
          ),
          const SizedBox(height: 16),
          ColorPicker(item: item),
          const SizedBox(height: 5),
          SizePicker(item: item),
          const SizedBox(height: 16),
          OdinElevatedButton(
            child: const OdinText(
              text: 'Add to cart',
              type: OdinTextType.custom,
              textSize: 14,
              textWeight: FontWeight.bold,
              textColor: ColorConstants.primaryColor,
            ),
            onPressed: () async {
              final size = ref.read(sizePickerProvider).pickedState!;
              final color = ref.read(colorPickerProvider).pickedState!;
              await ref.read(cartRepositoryProvider).add(item.id!, color, size);
              ref
                ..invalidate(cartProvider)
                ..read(cartProvider);
              // ignore: use_build_context_synchronously
              context.pop();
            },
          ),
        ],
      ),
    );
  }
}
