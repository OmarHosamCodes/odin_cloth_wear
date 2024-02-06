import '/library.dart';

class Sizing extends StatelessWidget {
  const Sizing(this.item, {super.key});
  final Item item;

  List<DataRow> get getRows {
    final List<DataRow> rows = [];
    for (Map<String, dynamic> sizing in item.sizing!) {
      sizing.forEach(
        (key, value) {
          rows.add(
            DataRow(
              cells: [
                DataCell(OdinText(text: key)),
                DataCell(OdinText(text: value[0])),
                DataCell(OdinText(text: value[1])),
                DataCell(OdinText(text: value[2])),
              ],
            ),
          );
        },
      );
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    const List<String> columns = ['', 'Length', 'Width', 'Sleeve'];
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          child: DataTable(
            dataRowColor:
                const MaterialStatePropertyAll(ColorConstants.cardColor),
            headingRowColor:
                const MaterialStatePropertyAll(ColorConstants.cardColor),
            border: TableBorder.all(
              color: ColorConstants.backgroundColor,
            ),
            sortAscending: false,
            decoration: const BoxDecoration(
              color: ColorConstants.chipColor,
            ),
            columns: columns
                .map((e) => DataColumn(
                      label: OdinText(text: e),
                    ))
                .toList(),
            rows: getRows,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Consumer(
            builder: (_, WidgetRef ref, __) {
              final adminAssetsWatcher = ref.watch(adminAssetsProvider);
              return adminAssetsWatcher.when(
                data: (adminAssets) {
                  return OdinImageNetwork(
                    width: 60,
                    height: 60,
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
          ),
        ),
      ],
    );
  }
}
