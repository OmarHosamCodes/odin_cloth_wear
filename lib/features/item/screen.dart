import 'package:odin_cloth_wear/library.dart';

/// A [StatelessWidget] that displays the item screen.
class ItemScreen extends StatelessWidget {
  /// A [StatelessWidget] that displays the item screen.
  const ItemScreen({
    required this.id,
    super.key,
    this.cachedItem,
  });

  /// The [Item] id.
  final String id;

  /// The [Item] to display.
  final Item? cachedItem;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Consumer(
        builder: (_, WidgetRef ref, __) {
          switch (cachedItem) {
            case null:
              final item = ref.read(itemProvider(id));
              return item.maybeWhen(
                // or else go to no page found
                data: (item) {
                  return CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: height,
                          child: ImageViewer(
                            item: item!,
                            showDetails: false,
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TitleAndPricing(item: item),
                                  const OdinDivider(),
                                  ColorPicker(item: item),
                                  SizePicker(item: item),
                                  AddToCart(item: item),
                                  Description(item: item),
                                  Sizing(item),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },

                orElse: () => const SliverToBoxAdapter(child: OdinLoader()),
              );
            default:
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: height,
                      child: ImageViewer(
                        item: cachedItem!,
                        showDetails: false,
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleAndPricing(item: cachedItem!),
                              const OdinDivider(),
                              ColorPicker(item: cachedItem!),
                              SizePicker(item: cachedItem!),
                              AddToCart(item: cachedItem!),
                              Description(item: cachedItem!),
                              Sizing(cachedItem!),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}
