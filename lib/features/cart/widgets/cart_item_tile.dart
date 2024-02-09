import 'package:odin_cloth_wear/library.dart';

/// A [ConsumerWidget] that displays a [CartItem] in a [ListTile].
class CartItemTile extends ConsumerWidget {
  /// A [ConsumerWidget] that displays a [CartItem] in a [ListTile].
  const CartItemTile({
    required this.cartItem,
    super.key,
  });

  /// The [CartItem] to display.
  final CartItem cartItem;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(itemProvider(cartItem.id));
    return item.when(
      data: (item) {
        return ListTile(
          leading: AspectRatio(
            aspectRatio: .8,
            child: OdinImageNetwork(
              source: item!.images!.first.toString(),
              fit: BoxFit.fitHeight,
            ),
          ),
          title: OdinText(
            text: item.name!,
            type: OdinTextType.custom,
            textSize: 16,
            textWeight: FontWeight.w600,
            textColor: ColorConstants.seccoundaryColor,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OdinText(
                text: '${item.price} EGP',
                type: OdinTextType.custom,
                textSize: 12,
                textWeight: FontWeight.w600,
                textColor: ColorConstants.seccoundaryColor,
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(cartItem.color!),
                        width: 2,
                      ),
                    ),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Color(cartItem.color!),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 30,
                    height: 30,
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: ColorConstants.seccoundaryColor,
                      border: Border.all(
                        color: ColorConstants.seccoundaryColor,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: OdinText(
                        text: cartItem.size!,
                        type: OdinTextType.custom,
                        textColor: ColorConstants.primaryColor,
                        textSize: 14,
                        textWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          trailing: IconButton(
            icon: const Icon(EvaIcons.trash2Outline, color: Colors.red),
            onPressed: () async {
              await ref.read(cartRepositoryProvider).delete(cartItem.id!);
              ref
                ..read(cartProvider)
                ..invalidate(cartProvider);
            },
          ),
        );
      },
      loading: () => const ListTile(
        title: OdinText(
          text: 'Loading...',
        ),
      ),
      error: (error, stackTrace) => const ListTile(
        title: OdinText(
          text: 'Failed to load item',
        ),
      ),
    );
  }
}
