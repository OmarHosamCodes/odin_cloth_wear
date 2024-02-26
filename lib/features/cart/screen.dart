import 'package:odin_cloth_wear/library.dart';

/// A [StatelessWidget] that displays the cart screen.
class CartScreen extends StatelessWidget {
  /// A [StatelessWidget] that displays the cart screen.
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          Consumer(
            builder: (_, WidgetRef ref, __) {
              final cartWatcher = ref.watch(cartProvider);

              return cartWatcher.maybeWhen(
                data: (cart) {
                  if (cart.isEmpty) {
                    return SliverToBoxAdapter(
                      child: SizedBox.fromSize(
                        size: const Size(175, 75),
                        child: const Center(
                          child: OdinText(
                            text: 'Cart is empty',
                            type: OdinTextType.custom,
                            textColor: ColorConstants.seccoundaryColor,
                            textSize: 18,
                            textWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }
                  return SliverList.separated(
                    separatorBuilder: (context, index) => const OdinDivider(),
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final cartItem = cart[index];
                      return CartItemTile(cartItem: cartItem);
                    },
                  );
                },
                orElse: () => SliverToBoxAdapter(
                  child: SizedBox.fromSize(
                    size: const Size(175, 75),
                    child: const Center(
                      child: OdinText(
                        text: 'Cart is empty',
                        type: OdinTextType.custom,
                        textColor: ColorConstants.seccoundaryColor,
                        textSize: 18,
                        textWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: Consumer(
                builder: (_, WidgetRef ref, __) {
                  final cartWatcher = ref.watch(cartProvider);
                  return cartWatcher.maybeWhen(
                    data: (cart) {
                      if (cart.isEmpty) {
                        return SizedBox.fromSize(
                          size: const Size(50, 50),
                          child: const OdinChip(
                            label: FittedBox(
                              child: OdinText(
                                text: 'Continue Shopping',
                                type: OdinTextType.subtitle,
                              ),
                            ),
                          ),
                        );
                      }
                      return OdinElevatedButton(
                        child: const OdinText(text: 'Checkout'),
                        onPressed: () {
                          if (cart.isEmpty) {
                            OdinToast.showErrorToast('Cart is empty');
                          } else {
                            OdinToast.showSuccessToast('Checkout');
                          }
                        },
                      );
                    },
                    orElse: () => const SizedBox(),
                  );
                },
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: Consumer(
              builder: (_, WidgetRef ref, __) {
                final itemsByTags =
                    ref.watch(filteredItemsByTagProvider('cart'));

                return itemsByTags.maybeWhen(
                  data: (items) {
                    return SliverGrid.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: .5,
                      ),
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AspectRatio(
                              aspectRatio: 4 / 5,
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  color: ColorConstants.primaryColor,
                                  child: ImageViewer(item: item),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              width: double.infinity,
                              child: OdinElevatedButton(
                                onPressed: () => openQuickAddSheet(
                                  context,
                                  item: item,
                                  ref: ref,
                                ),
                                child: const OdinText(text: 'Quick Add'),
                              ),
                            ),
                          ],
                        );
                      },
                      itemCount: items.length,
                    );
                  },
                  orElse: () => const SliverToBoxAdapter(
                    child: OdinLoader(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
