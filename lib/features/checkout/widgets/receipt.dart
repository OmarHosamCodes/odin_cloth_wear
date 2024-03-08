// ignore_for_file: lines_longer_than_80_chars

import 'package:odin_cloth_wear/library.dart';
import 'package:web_image_downloader/web_image_downloader.dart';

/// A class that represents a receipt.
void showReceipt(BuildContext context) {
  showModalBottomSheet<void>(
    // enableDrag: true,
    showDragHandle: true,
    isScrollControlled: true,
    backgroundColor: ColorConstants.seccoundaryColor,
    context: context,
    builder: (context) {
      return const Receipt();
    },
  );
}

/// A class that represents a receipt.
class Receipt extends ConsumerWidget {
  /// Creates an [Receipt]
  const Receipt({super.key});

  /// A [GlobalKey] for the [RepaintBoundary]
  static final _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mail = ref.watch(mailStateNotifierProvider);
    final total = mail.total;
    final items = mail.items;

    //?
    Future<void> capturePng() async {
      try {
        await WebImageDownloader.downloadImage(_globalKey, 'image.png');
      } catch (e) {
        OdinToast.showErrorToast('Error: $e');
      }
    }

    //?
    return RepaintBoundary(
      key: _globalKey,
      child: ColoredBox(
        color: ColorConstants.seccoundaryColor,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: ColorConstants.primaryColor,
                automaticallyImplyLeading: false,
                title: const OdinText(
                  text: 'Receipt',
                  type: OdinTextType.custom,
                  textColor: ColorConstants.seccoundaryColor,
                  textSize: 40,
                  textWeight: FontWeight.bold,
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: capturePng,
                    icon: const Icon(Icons.save),
                  ),
                ],
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final item = items[index];
                    return ListTile(
                      title: OdinText(text: item.name!),
                      subtitle: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 10,
                            color: Color(item.color!),
                          ),
                          const SizedBox(width: 8),
                          OdinText(
                            text: item.size!,
                            type: OdinTextType.subtitle,
                          ),
                        ],
                      ),
                      trailing: OdinText(
                        text:
                            '${item.price!.roundToDouble() * item.quantity} EPG',
                        type: OdinTextType.price,
                      ),
                      shape: const Border(
                        bottom: BorderSide(
                          color: ColorConstants.primaryColor,
                        ),
                      ),
                    );
                  },
                  childCount: items.length,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const OdinText(
                        text: 'Total:',
                        type: OdinTextType.custom,
                        textColor: ColorConstants.primaryColor,
                        textSize: 20,
                        textWeight: FontWeight.bold,
                      ),
                      OdinText(
                        text: '$total EPG',
                        type: OdinTextType.custom,
                        textColor: ColorConstants.primaryColor,
                        textSize: 20,
                        textWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
