import 'dart:async';

import '/library.dart';

class ImageRandomizerShowcase extends ConsumerStatefulWidget {
  const ImageRandomizerShowcase({
    super.key,
  });

  @override
  ConsumerState<ImageRandomizerShowcase> createState() =>
      _ImageRandomizerShowcaseState();
}

class _ImageRandomizerShowcaseState
    extends ConsumerState<ImageRandomizerShowcase> {
  final pageController = PageController();

  ValueNotifier<int> pagesLength = ValueNotifier<int>(1);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        Future.delayed(const Duration(seconds: 3), () {});
        Timer.periodic(
          const Duration(seconds: 3),
          (Timer timer) {
            if ((pageController.page!.toInt() + 1) % pagesLength.value == 0) {
              pageController.animateToPage(
                0,
                duration: Duration(milliseconds: (500 * pagesLength.value)),
                curve: Curves.easeIn,
              );
            } else {
              pageController.animateToPage(
                (pageController.page!.toInt() + 1) % pagesLength.value,
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeIn,
              );
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // return const OdinImageAsset(
    //   source: 'assets/images/wrapBackground.png',
    //   fit: BoxFit.cover,
    // );
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        final adminAssetsWatcher = ref.watch(adminAssetsProvider);
        return adminAssetsWatcher.when(
          data: (adminAssets) {
            pagesLength.value = adminAssets.backgroundImages.length;

            return PageView.builder(
              controller: pageController,
              itemCount: adminAssets.backgroundImages.length,
              itemBuilder: (context, index) => OdinImageNetwork(
                source: adminAssets.backgroundImages[index],
                fit: BoxFit.cover,
              ),
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
