import 'package:odin_cloth_wear/features/item/widgets/description.dart';

import '/library.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({
    super.key,
    required this.id,
  });
  final String id;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            EvaIcons.arrowBack,
            color: ColorConstants.backgroundColor,
          ),
          onPressed: () => context.pop(),
        ),
        title: const AppBarLogo(),
        centerTitle: true,
        actions: const [
          Icon(
            EvaIcons.shoppingCartOutline,
            color: ColorConstants.backgroundColor,
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
                crossAxisAlignment: CrossAxisAlignment.center,
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
