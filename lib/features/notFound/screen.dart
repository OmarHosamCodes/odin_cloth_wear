import '/library.dart';

class PageNotFoundScreen extends StatelessWidget {
  const PageNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
