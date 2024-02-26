// ignore_for_file: avoid_dynamic_calls, inference_failure_on_untyped_parameter

import 'package:odin_cloth_wear/library.dart';

/// A [StatelessWidget] that displays the sizing of an [Item].
class Sizing extends StatelessWidget {
  /// A [StatelessWidget] that displays the sizing of an [Item].
  const Sizing(this.item, {super.key});

  /// The [Item] to display.
  final Item item;

  /// The [DataRow]s to display.
  List<DataRow> get getRows {
    final rows = <DataRow>[];

    for (final sizing in item.sizing!) {
      sizing.forEach(
        (key, value) {
          rows.add(
            DataRow(
              cells: [
                DataCell(OdinText(text: key as String)),
                DataCell(OdinText(text: value[0] as String)),
                DataCell(OdinText(text: value[1] as String)),
                DataCell(OdinText(text: value[2] as String)),
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
    const columns = <String>['', 'Length', 'Width', 'Sleeve'];
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          child: DataTable(
            dataRowColor:
                const MaterialStatePropertyAll(ColorConstants.seccoundaryColor),
            headingRowColor:
                const MaterialStatePropertyAll(ColorConstants.seccoundaryColor),
            border: TableBorder.all(
              color: ColorConstants.primaryColor,
            ),
            sortAscending: false,
            decoration: const BoxDecoration(
              color: ColorConstants.seccoundaryColor,
            ),
            columns: columns
                .map(
                  (e) => DataColumn(
                    label: OdinText(text: e),
                  ),
                )
                .toList(),
            rows: getRows,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Consumer(
            builder: (_, WidgetRef ref, __) {
              final assetsWatcher = ref.watch(assetsProvider);
              return assetsWatcher.when(
                data: (assets) {
                  return OdinImageNetwork(
                    width: 60,
                    height: 60,
                    source: assets.logo,
                  );
                },
                loading: OdinLoader.new,
                error: (error, stackTrace) {
                  return const Center(
                    child: OdinText(text: 'error'),
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
