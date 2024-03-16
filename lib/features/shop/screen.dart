import 'package:odin_cloth_wear/library.dart';

/// Shop Screen
class ShopScreen extends StatelessWidget {
  /// Default constructor
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: height * 0.5,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Consumer(
                    builder: (_, WidgetRef ref, __) {
                      final itemsByTag =
                          ref.watch(filteredItemsByTagProvider('top'));

                      return itemsByTag.maybeWhen(
                        data: (items) {
                          return OdinImage(
                            source: items.first.images!.first.toString(),
                            fit: BoxFit.cover,
                            height: height * 0.5,
                            width: double.infinity,
                          );
                        },
                        orElse: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                  ),
                  const SizedBox.expand(
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: OdinText(
                        text: 'Shop',
                        style: TextStyle(
                          fontSize: 150,
                          color: ColorConstants.primaryColor,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Consumer(
            builder: (_, WidgetRef ref, __) {
              final assetsWatcher = ref.watch(assetsProvider);
              return assetsWatcher.maybeWhen(
                data: (assets) {
                  List<Category> getCategories() {
                    final _ = <Category>[];

                    for (final category in assets.categories) {
                      if (!_.contains(category)) {
                        _.add(
                          Category.fromJson(
                            category as Map<String, dynamic>,
                          ),
                        );
                      }
                    }

                    return _;
                  }

                  final categories = getCategories();
                  return SliverList.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final name = categories[index].name!;
                      final itemsByCategory = ref.watch(
                        filteredItemsByCategoryProvider(
                          (name, null),
                        ),
                      );
                      return itemsByCategory.maybeWhen(
                        data: (items) {
                          final itemsScrollController = ScrollController();
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: OdinText(
                                  text: name,
                                  type: OdinTextType.custom,
                                  textSize: 20,
                                  textWeight: FontWeight.bold,
                                  textColor: ColorConstants.seccoundaryColor,
                                ),
                                trailing: const OdinText(
                                  text: 'View All',
                                  type: OdinTextType.custom,
                                  textSize: 10,
                                  textWeight: FontWeight.bold,
                                  textColor: ColorConstants.seccoundaryColor,
                                ),
                                onTap: () => context.pushNamed(
                                  Routes.searchRoot,
                                  queryParameters: {
                                    'type': SearchTypeConstants.category,
                                    'query': name,
                                  },
                                ),
                              ),
                              GestureDetector(
                                onPanUpdate: (details) {
                                  if (details.delta.dx > 0) {
                                    itemsScrollController.animateTo(
                                      itemsScrollController.offset - 100,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                  } else {
                                    itemsScrollController.animateTo(
                                      itemsScrollController.offset + 100,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                  }
                                },
                                child: SizedBox(
                                  height: height * 0.3,
                                  child: ListView.builder(
                                    controller: itemsScrollController,
                                    shrinkWrap: true,
                                    itemCount: items.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: AspectRatio(
                                            aspectRatio: 2 / 3,
                                            child: OdinImage(
                                              source: items[index]
                                                  .images!
                                                  .first
                                                  .toString(),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        orElse: OdinLoader.new,
                      );
                    },
                  );
                },
                orElse: () => const SliverToBoxAdapter(child: OdinLoader()),
              );
            },
          ),
        ],
      ),
    );
  }
}
