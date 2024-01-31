import '/library.dart';

class ItemScreen extends ConsumerWidget {
  const ItemScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      backgroundColor: ColorConstants.cardColor,
      body: Center(
        child: OdinText(text: "Item Screen"),
      ),
    );
  }
}
