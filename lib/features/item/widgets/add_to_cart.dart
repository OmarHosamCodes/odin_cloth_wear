import '/library.dart';

class AddToCart extends ConsumerWidget {
  const AddToCart({super.key, required this.item});
  final Item item;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        final size = ref.read(sizePickerProvider).pickedState as String?;
        final color = ref.read(colorPickerProvider).pickedState as int?;

        if (size == null || color == null) {
          OdinToast.showErrorToast('Please select size and color');
        } else {
          try {
            ref.read(cartRepositoryProvider).add(
                  item.id!,
                  color,
                  size,
                );
            OdinToast.showSuccessToast('Item added to cart');
            ref.read(sizePickerProvider.notifier).reset();
            ref.read(colorPickerProvider.notifier).reset();
          } catch (e) {
            OdinToast.showErrorToast(
                'Failed to add item to cart. Please try again later.');
          }
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        color: ColorConstants.cardColor,
        width: double.infinity,
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: const Center(
          child: OdinText(
            text: 'Add to Cart',
            type: OdinTextType.title,
          ),
        ),
      ),
    );
  }
}
