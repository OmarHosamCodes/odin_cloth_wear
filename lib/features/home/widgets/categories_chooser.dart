import '/library.dart';

class CategoriesChooser extends StatelessWidget {
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  adminAssets.categories.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: OdinChip(
                      label: OdinText(
                        text: adminAssets.categories[index],
                        type: OdinTextType.subtitle,
                      ),
                    ),
                  ),
                ),
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
