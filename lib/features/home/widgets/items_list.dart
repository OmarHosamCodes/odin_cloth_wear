import 'package:odin_cloth_wear/library.dart';

/// A [StatelessWidget] that displays the contact info.
SliverGrid itemsList({
  required int crossAxisCount,
  required List<Item> items,
}) {
  return SliverGrid(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: .6,
    ),
    delegate: SliverChildBuilderDelegate(
      childCount: items.length,
      (_, int index) {
        final item = items[index];
        return Column(
          children: [
            AspectRatio(
              aspectRatio: 2 / 3,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 10,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  color: ColorConstants.seccoundaryColor,
                  child: ImageViewer(item: item),
                ),
              ),
            ),
            OdinChip(
              label: Row(
                children: [
                  OdinText(text: item.name!),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: SizedBox(
                      width: 10,
                      child: OdinDivider(
                        thickness: 2,
                      ),
                    ),
                  ),
                  OdinText(text: item.price.toString()),
                ],
              ),
            ),
          ],
        );
      },
    ),
  );
}
