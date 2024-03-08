import 'package:odin_cloth_wear/library.dart';

/// A [StatelessWidget] that displays a [ImageRandomizerShowcase].
class ImageRandomizerShowcase extends StatelessWidget {
  /// A [StatelessWidget] that displays a [ImageRandomizerShowcase].
  const ImageRandomizerShowcase({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        final itemsByTag = ref.watch(filteredItemsByTagProvider('top'));

        return itemsByTag.maybeWhen(
          data: (items) {
            return Stack(
              alignment: Alignment.center,
              children: [
                LoopingPageView(items: items, pageController: pageController),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: ColorConstants.overlayColor,
                  child: Center(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color:
                              ColorConstants.seccoundaryColor.withOpacity(.3),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: ColorConstants.primaryColor,
                          ),
                        ),
                        child: const FittedBox(
                          child: OdinText(
                            text: 'Shop Now',
                            type: OdinTextType.custom,
                            textColor: ColorConstants.primaryColor,
                            textSize: 30,
                            textWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          orElse: () => const Center(
            child: OdinLoader(),
          ),
        );
      },
    );
  }
}

/// A [StatefulWidget] that displays a [LoopingPageView].
class LoopingPageView extends StatefulWidget {
  /// A [StatefulWidget] that displays a [LoopingPageView].
  const LoopingPageView({
    required this.items,
    required this.pageController,
    super.key,
  });

  /// [LoopingPageView] items
  final List<Item> items;

  /// [LoopingPageView] page controller
  final PageController pageController;

  @override
  LoopingPageViewState createState() => LoopingPageViewState();
}

/// A [State] of [LoopingPageView].
class LoopingPageViewState extends State<LoopingPageView> {
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (_currentPage < widget.items.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      widget.pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollBehavior:
          const ScrollBehavior().copyWith(overscroll: false, scrollbars: false),
      controller: widget.pageController,
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        final item = widget.items[index];
        return OdinImageNetwork(
          source: item.images!.first.toString(),
          fit: BoxFit.cover,
        );
      },
    );
  }
}
