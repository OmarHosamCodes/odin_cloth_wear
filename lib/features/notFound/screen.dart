import 'package:odin_cloth_wear/library.dart';

/// A [StatelessWidget] that displays the page not found screen.
class PageNotFoundScreen extends StatelessWidget {
  /// A [StatelessWidget] that displays the page not found screen.
  const PageNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const OdinText(
              text: 'Page Not Found',
              type: OdinTextType.normal,
            ),
            const OdinText(
              text: '404',
              type: OdinTextType.normal,
            ),
            const SizedBox(
              height: 10,
            ),
            OdinChip(
              label: const OdinText(text: 'Return home'),
              onTap: () => context.goNamed(Routes.homeRoot),
            ),
          ],
        ),
      ),
    );
  }
}
