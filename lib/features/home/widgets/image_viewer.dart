import '/library.dart';

class ImageViewer extends StatelessWidget {
  const ImageViewer({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    ValueNotifier<int> currentPage = ValueNotifier(0);

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
                if (details.delta.dx > 0) {
                  if (currentPage.value == 0) {
                    return;
                  }
                  pageController.animateToPage(
                    currentPage.value - 1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                }

                if (details.delta.dx < 0) {
                  if (currentPage.value == item.images!.length - 1) {
                    return;
                  }
                  pageController.animateToPage(
                    currentPage.value + 1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                }
              },
              child: OdinImageNetwork(
                source: item.images![index],
                fit: BoxFit.cover,
              ),
            );
          },
        ),
        // Align(
        //   alignment: Alignment.bottomRight,
        //   child: Container(
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(4),
        //       color: const Color(0x960F0F0F),
        //       boxShadow: [
        //         BoxShadow(
        //           color: Colors.black.withOpacity(0.5),
        //           spreadRadius: 1,
        //           blurRadius: 2,
        //           offset: const Offset(0, 1), // changes position of shadow
        //         ),
        //       ],
        //     ),
        //     width: 40,
        //     padding: const EdgeInsets.all(4),
        //     margin: const EdgeInsets.all(4),
        //     child: FutureBuilder<bool>(
        //       future: Future.value(context.mounted),
        //       builder: (context, snapshot) {
        //         if (!snapshot.hasData ||
        //             !snapshot.data! ||
        //             item.images!.length == 1 ||
        //             snapshot.connectionState == ConnectionState.waiting) {
        //           return const SizedBox();
        //         }
        //         return Column(
        //           mainAxisSize: MainAxisSize.min,
        //           children: List.generate(
        //             item.images!.length,
        //             (imagesIndex) {
        //               return GestureDetector(
        //                 child: Padding(
        //                   padding: const EdgeInsets.symmetric(vertical: 5),
        //                   child: ValueListenableBuilder(
        //                     valueListenable: currentPage,
        //                     builder: (context, pageControllerPageWatcher, _) =>
        //                         AnimatedContainer(
        //                       duration: const Duration(milliseconds: 500),
        //                       width: 10,
        //                       height: 10,
        //                       decoration: BoxDecoration(
        //                         borderRadius: BorderRadius.circular(4),
        //                         color: pageControllerPageWatcher == imagesIndex
        //                             ? const Color(0xffF7F7F7)
        //                             : Colors.transparent,
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //                 onTap: () => pageController.animateToPage(
        //                   imagesIndex,
        //                   duration: const Duration(milliseconds: 500),
        //                   curve: Curves.ease,
        //                 ),
        //               );
        //             },
        //           ),
        //         );
        //       },
        //     ),
        //   ),
        // ),
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
                  (imagesIndex) {
                    return GestureDetector(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
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
                                    ? const Color(0xffF7F7F7)
                                    : const Color(0xffF7F7F7).withOpacity(0.5),
                              ),
                            ),
                          )),
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
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: const Color(0x960F0F0F),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  OdinText(
                    text: item.name!,
                    type: OdinTextType.title,
                  ),
                  OdinText(
                    text: item.description!,
                    type: OdinTextType.subtitle,
                  ),
                  const SizedBox(
                    width: 10,
                    child: Divider(),
                  ),
                  OdinText(
                    text: "${item.price} EGP",
                    type: OdinTextType.price,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
