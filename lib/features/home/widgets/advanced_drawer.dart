import '/library.dart';

class HomeAdvancedDrawer extends StatelessWidget {
  const HomeAdvancedDrawer({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    AdvancedDrawerController advancedDrawerController =
        AdvancedDrawerController();
    void handleMenuButtonPressed() {
      advancedDrawerController.showDrawer();
    }

    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [ColorConstants.chipColor, ColorConstants.cardColor],
          ),
        ),
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
          ],
        ),
      ),
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const FittedBox(
            fit: BoxFit.contain,
            child: AppBarLogo(),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(
                EvaIcons.search,
                color: ColorConstants.backgroundColor,
              ),
              onPressed: () {},
            ),
          ],
          leading: IconButton(
            icon: const Icon(
              EvaIcons.menu2Outline,
              color: ColorConstants.backgroundColor,
            ),
            onPressed: handleMenuButtonPressed,
          ),
        ),
        body: child,
      ),
    );
  }
}
