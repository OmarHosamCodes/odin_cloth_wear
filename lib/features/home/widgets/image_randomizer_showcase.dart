import 'package:odin_cloth_wear/library.dart';

/// A [ConsumerWidget] that displays a [ImageRandomizerShowcase].
class ImageRandomizerShowcase extends StatelessWidget {
  /// A [ConsumerWidget] that displays a [ImageRandomizerShowcase].
  const ImageRandomizerShowcase({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    final currentPage = ValueNotifier<int>(0);
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        final itemsByTag = ref.watch(filteredItemsByTagProvider('top'));
        return itemsByTag.when(
          data: (items) {
            return Stack(
              alignment: Alignment.center,
              children: [
                PageView.builder(
                  scrollBehavior: const ScrollBehavior()
                      .copyWith(overscroll: false, scrollbars: false),
                  controller: pageController,
                  itemCount: items.length,
                  onPageChanged: (index) => currentPage.value = index,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return GestureDetector(
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
                        source: item.images!.first.toString(),
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FutureBuilder<bool>(
                    future: Future.value(context.mounted),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData ||
                          !snapshot.data! ||
                          items.length == 1 ||
                          snapshot.connectionState == ConnectionState.waiting) {
                        return const SizedBox();
                      }
                      final children = <Widget>[];
                      for (var i = 0; i < items.length; i++) {
                        children.add(
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 5,
                            ),
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
                                  color: pageControllerPageWatcher == i
                                      ? ColorConstants.primaryColor
                                      : ColorConstants.primaryColor
                                          .withOpacity(0.5),
                                ),
                              ),
                            ),
                          ),
                        );
                      }

                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: children,
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
              child: OdinText(text: 'error'),
            );
          },
        );
      },
    );
  }
}
