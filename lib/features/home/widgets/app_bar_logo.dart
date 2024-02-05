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
              width: 95,
              height: 95,
              source: adminAssets.logo,
            );
          },
          loading: () => const OdinShimmer(
            height: 40,
            width: 40,
            type: OdinShimmerType.circle,
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
