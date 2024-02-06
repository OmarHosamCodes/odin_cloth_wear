import '/library.dart';

class CartItemTile extends ConsumerWidget {
  const CartItemTile({
    super.key,
    required this.cartItem,
  });
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
              source: item!.images!.first,
              fit: BoxFit.fitHeight,
            ),
          ),
          title: OdinText(
            text: item.name!,
            type: OdinTextType.custom,
            textSize: 16,
            textWeight: FontWeight.w600,
            textColor: ColorConstants.cardColor,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              OdinText(
                text: '${item.price} EGP',
                type: OdinTextType.custom,
                textSize: 12,
                textWeight: FontWeight.w600,
                textColor: ColorConstants.cardColor,
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
                      color: ColorConstants.cardColor,
                      border: Border.all(
                        color: ColorConstants.chipColor,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: OdinText(
                        text: cartItem.size!,
                        type: OdinTextType.custom,
                        textColor: ColorConstants.titleTextColor,
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
              ref.read(cartProvider);
              ref.invalidate(cartProvider);
            },
          ),
        );
      },
      loading: () => const ListTile(
        title: OdinText(
          text: 'Loading...',
          type: OdinTextType.title,
        ),
      ),
      error: (error, stackTrace) => const ListTile(
        title: OdinText(
          text: 'Failed to load item',
          type: OdinTextType.title,
        ),
      ),
    );
  }
}
