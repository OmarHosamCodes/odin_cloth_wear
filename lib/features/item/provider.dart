import 'package:odin_cloth_wear/library.dart';

/// Provider for [FirebaseFirestore] instance.
final firestoreProvider = Provider<FirebaseFirestore>(
  (ref) => FirebaseFirestore.instance,
);

/// Provider for [ItemRepository] instance.
final itemRepositoryProvider = Provider<ItemRepository>(
  (ref) => ItemRepository(
    ref.read(firestoreProvider),
  ),
);

/// Provider for a single [Item] instance based on the provided [Item] id.
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

/// Provider for a list of [Item] instances.
final itemsProvider = FutureProvider<List<Item>>(
  (ref) async {
    final items = await ref.read(itemRepositoryProvider).get();
    return Future.value(items);
  },
);
