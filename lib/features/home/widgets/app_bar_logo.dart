import 'package:odin_cloth_wear/library.dart';

/// A [StatelessWidget] that displays the app bar logo.
class AppBarLogo extends StatelessWidget {
  /// A [StatelessWidget] that displays the app bar logo.
  const AppBarLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        final assetsWatcher = ref.watch(assetsProvider);
        return assetsWatcher.maybeWhen(
          data: (assets) {
            return InkWell(
              onTap: () => context.go(Routes.home),
              child: OdinImage(
                width: 95,
                height: 95,
                source: assets.logo,
              ),
            );
          },
          orElse: () => const OdinLoader(),
        );
      },
    );
  }
}
