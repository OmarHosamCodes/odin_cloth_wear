import 'package:odin_cloth_wear/library.dart';

/// A [StatelessWidget] that displays the item screen.
class ItemScreen extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Consumer(
        builder: (_, WidgetRef ref, __) {
          final item = ref.watch(itemProvider(id));
          return item.maybeWhen(
            // or else go to no page found
            data: (item) {
              if (item == null) {
                return const Center(
                  child: OdinChip(
                    label: OdinText(
                      text: 'No item found',
                    ),
                  ),
                );
              }
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: height,
                      child: ImageViewer(
                        item: item,
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
                              TitleAndPricing(item: item),
                              const OdinDivider(),
                              ColorPicker(item: item),
                              SizePicker(item: item),
                              AddToCart(item: item),
                              Description(item: item),
                              Sizing(item),
                              const OdinDivider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },

            loading: () => SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: ColorConstants.seccoundaryColor,
                    height: height,
                    width: double.infinity,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    color: ColorConstants.seccoundaryColor,
                    height: 50,
                    width: double.infinity,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    color: ColorConstants.seccoundaryColor,
                    height: 40,
                    width: double.infinity,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    color: ColorConstants.seccoundaryColor,
                    height: 40,
                    width: double.infinity,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    color: ColorConstants.seccoundaryColor,
                    height: 30,
                    width: double.infinity,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    color: ColorConstants.seccoundaryColor,
                    height: 150,
                    width: double.infinity,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    color: ColorConstants.seccoundaryColor,
                    height: 30,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
            orElse: () => const OdinLoader(),
          );
        },
      ),
    );
  }
}
