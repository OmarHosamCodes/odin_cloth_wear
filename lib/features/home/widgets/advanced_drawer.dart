import '/library.dart';

class HomeAdvancedDrawer extends StatelessWidget {
  const HomeAdvancedDrawer({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    AdvancedDrawerController advancedDrawerController =
        AdvancedDrawerController();
    advancedDrawerController.value = AdvancedDrawerValue.hidden();
    void handleMenuButtonPressed() {
      advancedDrawerController.toggleDrawer();
    }

    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        color: ColorConstants.cardColor,
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //     colors: [ColorConstants.chipColor, ColorConstants.cardColor],
        //   ),
        // ),
      ),
      controller: advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      openScale: 1.0,
      disabledGestures: false,
      drawer: Align(
        alignment: Alignment.topCenter,
        child: ListView(
          shrinkWrap: true,
          children: [
            Consumer(
              builder: (_, WidgetRef ref, __) {
                final adminAssetsWatcher = ref.watch(adminAssetsProvider);
                return adminAssetsWatcher.when(
                  data: (adminAssets) {
                    return OdinImageNetwork(
                      source: adminAssets.logo,
                      height: 128,
                      width: 128,
                      fit: BoxFit.contain,
                    );
                  },
                  loading: () => const OdinShimmer(
                    height: 128,
                    width: 128,
                    type: OdinShimmerType.circle,
                  ),
                  error: (error, stackTrace) {
                    return const Center(
                      child: OdinText(text: "error"),
                    );
                  },
                );
              },
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                EvaIcons.home,
                color: ColorConstants.backgroundColor,
              ),
              title: const OdinText(text: 'Home'),
            ),
            ExpansionTile(
              childrenPadding: const EdgeInsets.only(left: 16),
              collapsedIconColor: ColorConstants.backgroundColor,
              leading: const Icon(
                EvaIcons.sun,
                color: ColorConstants.backgroundColor,
              ),
              title: const OdinText(text: 'Summer Collection'),
              children: [
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    EvaIcons.umbrella,
                    color: ColorConstants.backgroundColor,
                  ),
                  title: const OdinText(text: 'Beach Wear'),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    EvaIcons.umbrella,
                    color: ColorConstants.backgroundColor,
                  ),
                  title: const OdinText(text: 'Swim Wear'),
                ),
              ],
            ),
            ExpansionTile(
              childrenPadding: const EdgeInsets.only(left: 16),
              collapsedIconColor: ColorConstants.backgroundColor,
              leading: const Icon(
                EvaIcons.umbrella,
                color: ColorConstants.backgroundColor,
              ),
              title: const OdinText(text: 'Winter Collection'),
              children: [
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    EvaIcons.umbrella,
                    color: ColorConstants.backgroundColor,
                  ),
                  title: const OdinText(text: 'Jackets'),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    EvaIcons.umbrella,
                    color: ColorConstants.backgroundColor,
                  ),
                  title: const OdinText(text: 'Sweaters'),
                ),
              ],
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                EvaIcons.flash,
                color: ColorConstants.priceTextColor,
              ),
              title: const OdinText(text: 'Hot Now'),
            ),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Consumer(
                builder: (_, WidgetRef ref, __) {
                  final items = ref.watch(itemsProvider);
                  return items.maybeWhen(
                    data: (items) {
                      final controller = ScrollController(
                        initialScrollOffset: 20,
                        keepScrollOffset: true,
                      );
                      final hotItems = items
                          .where((item) => item.tags!.contains('hot'))
                          .toList();
                      return GestureDetector(
                        onPanUpdate: (details) {
                          if (details.delta.dx > 0) {
                            controller.jumpTo(controller.offset - 5);
                          } else if (details.delta.dx < 0) {
                            controller.jumpTo(controller.offset + 5);
                          }
                        },
                        child: ListView.builder(
                          controller: controller,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: hotItems.length,
                          itemBuilder: (context, index) {
                            final item = hotItems[index];
                            return OdinImageNetwork(
                              source: item.images!.first,
                              height: 100,
                              width: 100,
                              fit: BoxFit.contain,
                            );
                          },
                        ),
                      );
                    },
                    orElse: () => const OdinShimmer(
                      height: 128,
                      width: 128,
                      type: OdinShimmerType.circle,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          backgroundColor: ColorConstants.cardColor,
          elevation: 0,
          title: const FittedBox(
            fit: BoxFit.contain,
            child: AppBarLogo(),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              EvaIcons.menu2Outline,
              color: ColorConstants.backgroundColor,
            ),
            onPressed: handleMenuButtonPressed,
          ),
          actions: [
            Consumer(
              builder: (_, WidgetRef ref, __) {
                return IconButton(
                  onPressed: () {
                    ref.invalidate(cartProvider);
                    ref.read(cartProvider);
                    context.goNamed(Routes.cartRoot);
                  },
                  icon: const Icon(
                    EvaIcons.shoppingCartOutline,
                    color: ColorConstants.backgroundColor,
                  ),
                );
              },
            ),
          ],
        ),
        body: child,
      ),
    );
  }
}
