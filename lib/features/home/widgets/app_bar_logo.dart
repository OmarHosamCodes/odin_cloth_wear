import '/library.dart';

class AppBarLogo extends StatelessWidget {
  const AppBarLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        final adminAssetsWatcher = ref.watch(adminAssetsProvider);
        return adminAssetsWatcher.when(
          data: (adminAssets) {
            return OdinImageNetwork(
              source: adminAssets.logo,
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
