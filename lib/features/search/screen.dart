import 'package:odin_cloth_wear/library.dart';

/// A [StatelessWidget] that displays the search screen.
class SearchScreen extends StatelessWidget {
  /// A [StatelessWidget] that displays the search screen.
  const SearchScreen({
    required this.type,
    required this.query,
    super.key,
  });

  /// A [StatelessWidget] that displays the search screen by category.
  const SearchScreen.category({
    required this.query,
    super.key,
  }) : type = SearchTypeConstants.category;

  /// A [StatelessWidget] that displays the search screen by tag.
  const SearchScreen.tag({
    required this.query,
    super.key,
  }) : type = SearchTypeConstants.tag;

  /// A [StatelessWidget] that displays the search screen by name.
  const SearchScreen.name({
    required this.query,
    super.key,
  }) : type = SearchTypeConstants.name;

  /// A [StatelessWidget] that displays the search screen by query.
  const SearchScreen.query({
    required this.query,
    super.key,
  }) : type = SearchTypeConstants.query;

  /// The search query.
  final String query;

  /// The search type.
  final String type;

  @override
  Widget build(BuildContext context) {
    bool isDesktop() => !ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);

    bool isTablet() => !ResponsiveBreakpoints.of(context).smallerThan(TABLET);

    int crossAxisCount() {
      if (isDesktop()) return 3;
      if (isTablet()) return 2;
      return 1;
    }

    return Scaffold(
      body: Consumer(
        builder: (_, WidgetRef ref, __) {
          AsyncValue<List<Item>> asyncItemsWatcher() => switch (type) {
                SearchTypeConstants.category =>
                  ref.watch(filteredItemsByCategoryProvider(query)),
                SearchTypeConstants.tag =>
                  ref.watch(filteredItemsByTagProvider(query)),
                SearchTypeConstants.name =>
                  ref.watch(filteredItemsByNameProvider(query)),
                SearchTypeConstants.query =>
                  ref.watch(filteredItemsByQueryProvider(query)),
                _ => ref.watch(filteredItemsByQueryProvider(query))
              };

          final asyncItems = asyncItemsWatcher();

          return asyncItems.when(
            data: (items) {
              return CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .05,
                    ),
                    sliver: itemsList(
                      crossAxisCount: crossAxisCount(),
                      items: items,
                    ),
                  ),
                ],
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (error, stackTrace) => Center(
              child: Text(error.toString()),
            ),
          );
        },
      ),
    );
  }
}

/// A class that contains the search type constants.
class SearchTypeConstants {
  /// A class that contains the search type constants.
  static const category = 'category';

  /// A class that contains the search type constants.
  static const tag = 'tag';

  /// A class that contains the search type constants.
  static const name = 'name';

  /// A class that contains the search type constants.
  static const query = 'query';
}
