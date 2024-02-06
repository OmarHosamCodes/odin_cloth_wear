import '/library.dart';

void openQuickAddSheet(BuildContext context,
    {required Item item, required WidgetRef ref}) {
  showModalBottomSheet(
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

class QuickAddSheet extends StatelessWidget {
  const QuickAddSheet({super.key, required this.item, required this.ref});
  final Item item;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const OdinText(
            text: 'Quick Add',
            type: OdinTextType.custom,
            textSize: 16,
            textWeight: FontWeight.bold,
            textColor: ColorConstants.cardColor,
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
              textColor: ColorConstants.titleTextColor,
            ),
            onPressed: () async {
              final size = ref.read(sizePickerProvider).pickedState;
              final color = ref.read(colorPickerProvider).pickedState;
              await ref.read(cartRepositoryProvider).add(item.id!, color, size);
              ref.invalidate(cartProvider);
              ref.read(cartProvider);

              context.pop();
              ref.read(sizePickerProvider.notifier).reset();
              ref.read(colorPickerProvider.notifier).reset();
            },
          ),
        ],
      ),
    );
  }
}
