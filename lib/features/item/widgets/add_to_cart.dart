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
        // ref.read(cartRepositoryProvider).add(
        //       item.id!,
        //       size,
        //       color,
        //     );
        size.toString().log();
        color.toString().log();
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
