import '/library.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final scrollController = ScrollController();
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          const SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 400,
            centerTitle: true,
            leading: AppBarLogo(),
            flexibleSpace: FlexibleSpaceBar(
              background: ImageRandomizerShowcase(),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(48),
              child: CategoriesChooser(),
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
                            child: Container(
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 10,
                                  offset: const Offset(0, 10),
                                ),
                              ]),
                              child: Card(
                                clipBehavior: Clip.antiAlias,
                                color: ColorConstants.cardColor,
                                child: ImageViewer(item: item),
                              ),
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
