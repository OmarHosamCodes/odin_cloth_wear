import 'package:odin_cloth_wear/library.dart';

/// A [ConsumerWidget] that adds an [Item] to the cart.
class AddToCart extends ConsumerWidget {
  /// A [ConsumerWidget] that adds an [Item] to the cart.
  const AddToCart({required this.item, super.key});

  /// The [Item] to add.
  final Item item;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        final size = ref.read(sizePickerProvider).pickedState;
        final color = ref.read(colorPickerProvider).pickedState;

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
          } catch (e) {
            OdinToast.showErrorToast(
              'Failed to add item to cart. Please try again later.',
            );
          }
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        color: ColorConstants.seccoundaryColor,
        width: double.infinity,
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: const Center(
          child: OdinText(
            text: 'Add to Cart',
          ),
        ),
      ),
    );
  }
}
