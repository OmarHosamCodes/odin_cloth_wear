import 'package:odin_cloth_wear/features/cart/widgets/quick_add_sheet.dart';

import '/library.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const OdinText(
          text: 'Cart',
          type: OdinTextType.custom,
          textColor: ColorConstants.cardColor,
          textSize: 14,
          textWeight: FontWeight.bold,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(EvaIcons.arrowBack),
          onPressed: () => context.goNamed(Routes.homeRoot),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: [
            Consumer(
              builder: (_, WidgetRef ref, __) {
                final cartWatcher = ref.watch(cartProvider);

                return cartWatcher.when(
                  data: (cart) {
                    if (cart.isEmpty) {
                      return const SliverToBoxAdapter(
                        child: Center(
                          child: OdinText(
                            text: 'Cart is empty',
                            type: OdinTextType.custom,
                            textColor: ColorConstants.cardColor,
                            textSize: 14,
                            textWeight: FontWeight.bold,
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
                  loading: () => const SliverToBoxAdapter(
                    child: Center(
                      child: OdinText(
                        text: 'Cart is empty',
                        type: OdinTextType.custom,
                        textColor: ColorConstants.cardColor,
                        textSize: 14,
                        textWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  error: (error, stackTrace) => const SliverToBoxAdapter(
                    child: Center(
                      child: OdinText(
                        text: 'Cart is empty',
                        type: OdinTextType.custom,
                        textColor: ColorConstants.cardColor,
                        textSize: 14,
                        textWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
            SliverToBoxAdapter(
              child: Consumer(
                builder: (_, WidgetRef ref, __) {
                  final cartWatcher = ref.watch(cartProvider);
                  return cartWatcher.when(
                    data: (cart) {
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
                    loading: () => const SizedBox(),
                    error: (error, stackTrace) => const SizedBox(),
                  );
                },
              ),
            ),
            Consumer(
              builder: (_, WidgetRef ref, __) {
                final itemsWatcher = ref.watch(itemsProvider);

                return itemsWatcher.when(
                  data: (value) {
                    final hotItems = value
                        .where((item) => item.tags!.contains('hot'))
                        .toList();
                    return SliverGrid.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: .5,
                      ),
                      itemBuilder: (context, index) {
                        final item = hotItems[index];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AspectRatio(
                              aspectRatio: 4 / 5,
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 5,
                                      spreadRadius: 0,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  color: ColorConstants.cardColor,
                                  child: ImageViewer(item: item),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            OdinElevatedButton(
                              onPressed: () => openQuickAddSheet(context,
                                  item: item, ref: ref),
                              child: const OdinText(text: 'Quick Add'),
                            ),
                          ],
                        );
                      },
                      itemCount: hotItems.length,
                    );
                  },
                  loading: () => const SliverToBoxAdapter(
                    child: OdinShimmer(
                      height: 100,
                      width: 100,
                    ),
                  ),
                  error: (error, stackTrace) => const SliverToBoxAdapter(
                    child: OdinText(
                      text: 'Error loading hot items',
                      type: OdinTextType.custom,
                      textColor: ColorConstants.cardColor,
                      textSize: 14,
                      textWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
