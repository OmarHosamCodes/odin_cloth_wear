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

      return item;
    }
  },
);

/// Provider for a list of [Item] instances.
final itemsProvider = FutureProvider<List<Item>>(
  (ref) async {
    final items = await ref.read(itemRepositoryProvider).get();
    return items;
  },
);

/// Provider for a list of [Item] instances filtered by category.
final filteredItemsByCategoryProvider =
    FutureProvider.family<List<Item>, String>(
  (ref, category) async {
    final items =
        await ref.read(itemRepositoryProvider).getByCategory(category);
    return items;
  },
);

/// Provider for a list of [Item] instances filtered by tag.
final filteredItemsByTagProvider = FutureProvider.family<List<Item>, String>(
  (ref, tag) async {
    final items = await ref.read(itemRepositoryProvider).getByTag(tag);
    return items;
  },
);

/// Provider for a list of [Item] instances filtered by name.
final filteredItemsByNameProvider = FutureProvider.family<List<Item>, String>(
  (ref, name) async {
    final items = await ref.read(itemRepositoryProvider).getByName(name);
    return items;
  },
);

/// Provider for a list of [Item] instances filtered by query.
final filteredItemsByQueryProvider = FutureProvider.family<List<Item>, String>(
  (ref, query) async {
    final items = await ref.read(itemRepositoryProvider).getByQuery(query);
    return items;
  },
);
