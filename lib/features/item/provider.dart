import '/library.dart';

final firestoreProvider = Provider<FirebaseFirestore>(
  (ref) => FirebaseFirestore.instance,
);

final itemRepositoryProvider = Provider<ItemRepository>(
  (ref) => ItemRepository(
    ref.read(firestoreProvider),
  ),
);

final itemProvider = FutureProvider.family<Item?, String?>(
  (ref, itemId) async {
    if (itemId == null) {
      return null;
    } else {
      final item = await ref.read(itemRepositoryProvider).getById(itemId);
      return Future.value(item.$1);
    }
  },
);
final itemsProvider = FutureProvider<List<Item>>(
  (ref) async {
    final items = await ref.read(itemRepositoryProvider).get();
    return Future.value(items);
  },
);
