import 'package:odin_cloth_wear/library.dart';

/// A [StatelessWidget] that displays the item screen.
class ItemScreen extends StatelessWidget {
  /// A [StatelessWidget] that displays the item screen.
  const ItemScreen({
    required this.id,
    super.key,
  });

  /// The [Item] id.
  final String id;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: ColorConstants.seccoundaryColor,
        leading: IconButton(
          icon: const Icon(
            EvaIcons.arrowBack,
            color: ColorConstants.primaryColor,
          ),
          onPressed: () => context.pop(),
        ),
        title: const AppBarLogo(),
        centerTitle: true,
        actions: [
          Consumer(
            builder: (_, WidgetRef ref, __) {
              return IconButton(
                onPressed: () {
                  ref
                    ..invalidate(cartProvider)
                    ..read(cartProvider);
                  context.goNamed(Routes.cartRoot);
                },
                icon: const Icon(
                  EvaIcons.shoppingCartOutline,
                  color: ColorConstants.primaryColor,
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer(
        builder: (_, WidgetRef ref, __) {
          final item = ref.watch(itemProvider(id));
          return item.when(
            // or else go to no page found
            data: (item) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: height,
                      child: Hero(
                        tag: item!.id!,
                        child: ImageViewer(
                          item: item,
                          showDetails: false,
                        ),
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
                              const Reviews(),
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
                  OdinShimmer(
                    height: height,
                    width: double.infinity,
                  ),
                  const SizedBox(height: 10),
                  const OdinShimmer(
                    height: 50,
                    width: double.infinity,
                  ),
                  const SizedBox(height: 10),
                  const OdinShimmer(
                    height: 40,
                    width: double.infinity,
                  ),
                  const SizedBox(height: 10),
                  const OdinShimmer(
                    height: 40,
                    width: double.infinity,
                  ),
                  const SizedBox(height: 10),
                  const OdinShimmer(
                    height: 30,
                    width: double.infinity,
                  ),
                  const SizedBox(height: 10),
                  const OdinShimmer(
                    height: 150,
                    width: double.infinity,
                  ),
                  const SizedBox(height: 10),
                  const OdinShimmer(
                    height: 30,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
            error: (error, stackTrace) => Center(
              child: OdinText(
                text: error.toString(),
              ),
            ),
          );
        },
      ),
    );
  }
}
