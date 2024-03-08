import 'package:odin_cloth_wear/library.dart';

/// A [StatelessWidget] that displays the home screen.
class HomeScreen extends StatelessWidget {
  /// A [StatelessWidget] that displays the home screen.
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    bool isDesktop() => !ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);

    bool isTablet() => !ResponsiveBreakpoints.of(context).smallerThan(TABLET);

    int crossAxisCount() {
      if (isDesktop()) return 3;
      if (isTablet()) return 2;
      return 1;
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: height,
              child: const ImageRandomizerShowcase(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: width * .05),
            sliver: Consumer(
              builder: (_, WidgetRef ref, __) {
                final items = ref.watch(itemsProvider);
                return items.maybeWhen(
                  data: (items) {
                    return SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount(),
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: .6,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        childCount: items.length,
                        (_, int index) {
                          final item = items[index];
                          return Column(
                            children: [
                              AspectRatio(
                                aspectRatio: 2 / 3,
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
                                    color: ColorConstants.seccoundaryColor,
                                    child: ImageViewer(item: item),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: OdinChip(
                                  label: Row(
                                    mainAxisSize: MainAxisSize.min,
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
                                      OdinText(
                                        text: item.price.toString(),
                                        type: OdinTextType.price,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                  orElse: () => const SliverToBoxAdapter(child: OdinLoader()),
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Consumer(
              builder: (_, WidgetRef ref, __) {
                final assetsWatcher = ref.watch(assetsProvider);
                return assetsWatcher.maybeWhen(
                  data: (assets) {
                    return ContactInfo(assets: assets);
                  },
                  orElse: () => const OdinLoader(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
