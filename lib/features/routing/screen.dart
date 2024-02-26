import 'package:odin_cloth_wear/library.dart';

/// A [ConsumerWidget] that displays a [CartItem] in a [ListTile].
class RoutingScreen extends StatelessWidget {
  /// A [ConsumerWidget] that displays a [CartItem] in a [ListTile].
  const RoutingScreen({required this.child, super.key});

  /// The [Widget] to display.
  final Widget child;

  /// The noborder shape
  ShapeBorder? get noBorder {
    return ShapeBorder.lerp(
      const RoundedRectangleBorder(),
      const RoundedRectangleBorder(),
      0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final advancedDrawerController = AdvancedDrawerController();
    void handleMenuButtonPressed() {
      advancedDrawerController.toggleDrawer();
    }

    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        color: ColorConstants.seccoundaryColor,
      ),
      controller: advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      drawer: FutureBuilder(
        future: Future<void>.delayed(const Duration(milliseconds: 500)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const OdinLoader();
          }
          return Align(
            alignment: Alignment.topCenter,
            child: ListView(
              shrinkWrap: true,
              children: [
                Consumer(
                  builder: (_, WidgetRef ref, __) {
                    final assetsWatcher = ref.watch(assetsProvider);
                    return assetsWatcher.when(
                      data: (assets) {
                        return OdinImageNetwork(
                          source: assets.logo,
                          height: 128,
                          width: 128,
                          fit: BoxFit.contain,
                        );
                      },
                      loading: () => const OdinLoader(),
                      error: (error, stackTrace) {
                        return const Center(
                          child: OdinText(text: 'error'),
                        );
                      },
                    );
                  },
                ),
                ListTile(
                  onTap: () => context.go(Routes.home),
                  leading: const Icon(
                    EvaIcons.home,
                    color: ColorConstants.primaryColor,
                  ),
                  title: const OdinText(text: 'Home'),
                ),
                Consumer(
                  builder: (_, WidgetRef ref, __) {
                    final assetsWatcher = ref.watch(assetsProvider);
                    final categories = assetsWatcher.maybeWhen(
                      data: (assets) {
                        final categories = List<Category>.from(
                          assets.categories
                              .map(
                                (category) => Category.fromJson(
                                  category as Map<String, dynamic>,
                                ),
                              )
                              .toList(),
                        );

                        return categories;
                      },
                      orElse: () => [
                        Category('loading', ['...', '...']),
                      ],
                    );
                    final categoryList = <Widget>[];
                    for (final e in categories) {
                      categoryList.add(
                        ListTile(
                          shape: noBorder,
                          title: OdinText(text: e.name ?? 'loading'),
                          onTap: () {
                            context.goNamed(
                              Routes.searchRoot,
                              queryParameters: {
                                'query': e.name,
                                'type': SearchTypeConstants.category,
                              },
                            );
                          },
                        ),
                      );
                    }
                    return ExpansionTile(
                      childrenPadding: const EdgeInsets.only(left: 16),
                      collapsedIconColor: ColorConstants.primaryColor,
                      leading: const Icon(
                        EvaIcons.funnel,
                        color: ColorConstants.primaryColor,
                      ),
                      title: const OdinText(text: 'Categories'),
                      shape: noBorder,
                      children: categoryList,
                    );
                  },
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    EvaIcons.flash,
                    color: Color(0xFFFFD740),
                  ),
                  title: const OdinText(text: 'Hot Now'),
                ),
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Consumer(
                    builder: (_, WidgetRef ref, __) {
                      final itemsByTags =
                          ref.watch(filteredItemsByTagProvider('hot'));
                      return itemsByTags.maybeWhen(
                        data: (items) {
                          final controller = ScrollController();

                          return GestureDetector(
                            onPanUpdate: (details) {
                              if (details.delta.dx > 0) {
                                controller.jumpTo(controller.offset - 5);
                              } else if (details.delta.dx < 0) {
                                controller.jumpTo(controller.offset + 5);
                              }
                            },
                            child: ListView.separated(
                              padding: const EdgeInsets.only(left: 20),
                              controller: controller,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: items.length,
                              separatorBuilder: (context, index) {
                                return const Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    SizedBox(
                                      height: 30,
                                      child: VerticalDivider(
                                        thickness: .5,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                );
                              },
                              itemBuilder: (context, index) {
                                final item = items[index];
                                return InkWell(
                                  onTap: () {
                                    context.pushNamed(
                                      Routes.itemRoot,
                                      pathParameters: {
                                        'id': item.id!,
                                      },
                                      extra: item,
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(3),
                                    child: AspectRatio(
                                      aspectRatio: 2 / 3,
                                      child: OdinImageNetwork(
                                        source: item.images!.first.toString(),
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        orElse: () => const OdinLoader(),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: ColorConstants.seccoundaryColor,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: const FittedBox(
            child: AppBarLogo(),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              EvaIcons.menu2Outline,
              color: ColorConstants.primaryColor,
            ),
            onPressed: handleMenuButtonPressed,
          ),
          actions: [
            Consumer(
              builder: (_, WidgetRef ref, __) {
                return IconButton(
                  onPressed: () {
                    ref
                      ..invalidate(cartProvider)
                      ..read(cartProvider);
                    context.pushNamed(Routes.cartRoot);
                  },
                  icon: const Icon(
                    EvaIcons.shoppingCartOutline,
                    color: ColorConstants.primaryColor,
                  ),
                );
              },
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 60,
              width: double.infinity,
              color: ColorConstants.seccoundaryColor,
              child: SearchBar(
                backgroundColor: const MaterialStatePropertyAll(
                  ColorConstants.primaryColor,
                ),
                elevation: const MaterialStatePropertyAll(0),
                hintText: 'Search for categories, tags, etc',
                onSubmitted: (query) {
                  context.goNamed(
                    Routes.searchRoot,
                    queryParameters: {
                      'query': query,
                      'type': SearchTypeConstants.query,
                    },
                  );
                },
                trailing: const [
                  Icon(
                    Icons.search,
                    color: ColorConstants.seccoundaryColor,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: child,
      ),
    );
  }
}
