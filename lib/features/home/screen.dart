import 'package:odin_cloth_wear/features/home/widgets/contact_info.dart';

import '/library.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final scrollController = ScrollController();
    bool isDesktop() {
      if (ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)) return false;
      return true;
    }

    bool isTablet() {
      if (ResponsiveBreakpoints.of(context).smallerThan(TABLET)) return false;
      return true;
    }

    int crossAxisCount() {
      if (isDesktop()) return 3;
      if (isTablet()) return 2;
      return 1;
    }

    return HomeAdvancedDrawer(
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: height,
              child: const ImageRandomizerShowcase(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: width * .05),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount(),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.65,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Consumer(
                    builder: (_, WidgetRef ref, __) {
                      final items = ref.watch(itemsProvider);

                      return items.when(
                        data: (items) {
                          final Item item = items[index];
                          return Column(
                            children: [
                              AspectRatio(
                                aspectRatio: 4 / 5,
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.5),
                                        blurRadius: 10,
                                        offset: const Offset(0, 10),
                                      ),
                                    ],
                                  ),
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    color: ColorConstants.cardColor,
                                    child: Hero(
                                      tag: item.id!,
                                      child: ImageViewer(item: item),
                                    ),
                                  ),
                                ),
                              ),
                              OdinChip(
                                label: Row(
                                  children: [
                                    OdinText(text: item.name!),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 5,
                                      ),
                                      child: SizedBox(
                                        width: 10,
                                        child: OdinDivider(
                                          thickness: 2,
                                        ),
                                      ),
                                    ),
                                    OdinText(text: item.price.toString()),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        error: (error, stackTrace) {
                          return Center(
                            child: Text(error.toString()),
                          );
                        },
                      );
                    },
                  );
                },
                childCount: 2,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Consumer(
              builder: (_, WidgetRef ref, __) {
                final adminAssets = ref.watch(adminAssetsProvider);
                return adminAssets.when(
                  data: (adminAssets) {
                    return ContactInfo(adminAssets: adminAssets);
                  },
                  loading: () => OdinShimmer(
                    height: height,
                    width: width,
                  ),
                  error: (error, stackTrace) => const Center(
                    child: OdinText(text: 'Contact Info'),
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
