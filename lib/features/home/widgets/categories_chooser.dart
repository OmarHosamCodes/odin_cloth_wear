import 'package:odin_cloth_wear/library.dart';

/// A [ConsumerWidget] that displays a [CartItem] in a [ListTile].
class CategoriesChooser extends StatelessWidget {
  /// A [ConsumerWidget] that displays a [CartItem] in a [ListTile].
  const CategoriesChooser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        final adminAssetsWatcher = ref.watch(adminAssetsProvider);
        return adminAssetsWatcher.when(
          data: (adminAssets) {
            return SizedBox(
              height: 50,
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  adminAssets.categories.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(4),
                    child: OdinChip(
                      label: OdinText(
                        text: adminAssets.categories[index].toString(),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          loading: () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              2,
              (index) => const OdinShimmer(
                height: 40,
                width: 80,
              ),
            ),
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
