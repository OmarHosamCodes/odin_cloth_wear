import 'package:odin_cloth_wear/view/widgets/public/odin_image.dart';
import 'package:odin_cloth_wear/view/widgets/public/odin_text.dart';

import '../../../utils/providers/items_provider.dart';
import '/library.dart';

final scrollController = ScrollController();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> chipLabels = <String>[
      'Shirts',
      'Hoodie',
      'Summer Collection',
    ];
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            centerTitle: true,
            flexibleSpace: const FlexibleSpaceBar(
              background: OdinImageNetwork(
                source:
                    'https://firebasestorage.googleapis.com/v0/b/odin-cloth-wear-sever-dev.appspot.com/o/collection1%2Fbanner.png?alt=media&token=f4a0edbb-853e-462a-af18-4f853b302802',
                fit: BoxFit.cover,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(48),
              child: Wrap(
                children: chipLabels
                    .map(
                      (String label) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Chip(
                          clipBehavior: Clip.antiAlias,
                          backgroundColor: ColorConstants.cardColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          label: OdinText(text: label),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: width * .05),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Consumer(
                    builder: (_, WidgetRef ref, __) {
                      final items = ref.watch(itemsProvider);

                      return items.when(
                        data: (items) {
                          final Item item = items[index];
                          return AspectRatio(
                            aspectRatio: 4 / 5,
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              color: ColorConstants.cardColor,
                              child: ImageViewer(item: item),
                            ),
                          ).animate().boxShadow(
                                begin: BoxShadow(
                                  color: Colors.black.withOpacity(0.0),
                                  blurRadius: 0,
                                  offset: const Offset(0, 0),
                                ),
                                end: BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 10,
                                  offset: const Offset(0, 10),
                                ),
                              );
                        },
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        error: (error, stackTrace) {
                          return Center(
                            child: Text(error.toString()),
                          );
                        },
                      );
                    },
                  );
                },
                childCount: 2,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 70,
              color: ColorConstants.cardColor,
              child: const Center(
                child: OdinText(text: 'Contact Info'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageViewer extends StatelessWidget {
  const ImageViewer({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();

    return Stack(
      alignment: Alignment.center,
      children: [
        PageView.builder(
          scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          itemCount: item.images!.length,
          itemBuilder: (context, index) {
            return OdinImageNetwork(
              source: item.images![index],
              fit: BoxFit.cover,
            ).animate().saturate(
                  begin: 0.0,
                  end: 1.0,
                  duration: Duration(milliseconds: 500 * (index + 1)),
                );
          },
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: const Color(0xFF0f0f0f),
            ),
            width: 40,
            padding: const EdgeInsets.all(4),
            margin: const EdgeInsets.all(4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...List.generate(
                  item.images!.length,
                  (imagesIndex) {
                    return GestureDetector(
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Icon(
                          Icons.radio_button_on_rounded,
                          size: 24,
                          color: Color(0xffF7F7F7),
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
                Container(
                  height: 1,
                  width: 30,
                  color: const Color(0xffF7F7F7),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
