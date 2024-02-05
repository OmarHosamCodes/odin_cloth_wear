import '/library.dart';

class ImageRandomizerShowcase extends StatelessWidget {
  const ImageRandomizerShowcase({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    ValueNotifier<int> currentPage = ValueNotifier(0);
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        final adminAssetsWatcher = ref.watch(adminAssetsProvider);
        return adminAssetsWatcher.when(
          data: (adminAssets) {
            return Stack(
              alignment: Alignment.center,
              children: [
                PageView.builder(
                  scrollBehavior: const ScrollBehavior()
                      .copyWith(overscroll: false, scrollbars: false),
                  controller: pageController,
                  itemCount: adminAssets.backgroundImages.length,
                  onPageChanged: (index) => currentPage.value = index,
                  itemBuilder: (context, index) => GestureDetector(
                    onPanUpdate: (details) {
                      if (details.delta.dx > 0) {
                        pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      } else {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    child: OdinImageNetwork(
                      source: adminAssets.backgroundImages[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FutureBuilder<bool>(
                    future: Future.value(context.mounted),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData ||
                          !snapshot.data! ||
                          adminAssets.backgroundImages.length == 1 ||
                          snapshot.connectionState == ConnectionState.waiting) {
                        return const SizedBox();
                      }
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          adminAssets.backgroundImages.length,
                          (imagesIndex) {
                            return GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                child: ValueListenableBuilder(
                                  valueListenable: currentPage,
                                  builder:
                                      (context, pageControllerPageWatcher, _) =>
                                          AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: pageControllerPageWatcher ==
                                              imagesIndex
                                          ? const Color(0xffF7F7F7)
                                          : const Color(0xffF7F7F7)
                                              .withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () => pageController.animateToPage(
                                imagesIndex,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stackTrace) {
            return const Center(
              child: OdinText(text: "error"),
            );
          },
        );
      },
    );
  }
}
