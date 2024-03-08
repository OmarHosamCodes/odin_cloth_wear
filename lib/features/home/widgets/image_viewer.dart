import 'package:odin_cloth_wear/library.dart';

/// A [StatelessWidget] that displays the images of an [Item].
class ImageViewer extends StatelessWidget {
  /// A [StatelessWidget] that displays the images of an [Item].
  const ImageViewer({
    required this.item,
    super.key,
    this.showDetails = true,
  });

  /// The [Item] to display.
  final Item item;

  /// Whether to show the details of the [Item].
  final bool showDetails;

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    final currentPage = ValueNotifier<int>(0);

    return Stack(
      alignment: Alignment.center,
      children: [
        PageView.builder(
          scrollBehavior: const ScrollBehavior()
              .copyWith(overscroll: false, scrollbars: false),
          controller: pageController,
          itemCount: item.images!.length,
          onPageChanged: (index) {
            currentPage.value = index;
          },
          itemBuilder: (context, index) {
            return GestureDetector(
              onPanUpdate: (details) {
                if (details.delta.dx > 0 && currentPage.value != 0) {
                  pageController.animateToPage(
                    currentPage.value - 1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                }

                if (details.delta.dx < 0 &&
                    currentPage.value != item.images!.length - 1) {
                  pageController.animateToPage(
                    currentPage.value + 1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                }
              },
              onTap: () => context.goNamed(
                Routes.itemRoot,
                pathParameters: <String, String>{
                  'id': item.id!,
                },
                extra: item,
              ),
              child: OdinImageNetwork(
                source: item.images![index].toString(),
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
                  item.images!.length == 1 ||
                  snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox();
              }
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  item.images!.length,
                  (imagesIndex) => GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 5,
                      ),
                      child: ValueListenableBuilder(
                        valueListenable: currentPage,
                        builder: (context, pageControllerPageWatcher, _) =>
                            AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: pageControllerPageWatcher == imagesIndex
                                ? ColorConstants.primaryColor
                                : ColorConstants.primaryColor.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                    onTap: () => pageController.animateToPage(
                      imagesIndex,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
