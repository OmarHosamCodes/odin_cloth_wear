import 'package:odin_cloth_wear/library.dart';

/// A class to represent an [ItemRepository]

class ItemRepository {
  /// [ItemRepository] constructor
  ItemRepository(
    this.firestore,
  );

  /// [FirebaseFirestore] instance
  final FirebaseFirestore firestore;

  /// [ItemRepository] instance
  static final ItemRepository instance =
      ItemRepository(FirebaseFirestore.instance);

  /// [Item]s collection
  static const String collection = 'items';

  /// [Item]s collection
  CollectionReference get _itemsCollection => firestore.collection(collection);

  /// GET [Item] by id
  Future<Item?> getById(String? itemId) async {
    final snapshot = await _itemsCollection.doc(itemId).get();
    if (snapshot.exists) {
      return Item.fromJson(snapshot.data()! as Map<String, dynamic>);
    }
    return null;
  }

  /// GET [Item]s by category
  Future<List<Item>> getByCategory(String category, int? limit) {
    return _itemsCollection
        .where('category', isGreaterThanOrEqualTo: category)
        .limit(limit ?? 5)
        .get()
        .then((value) {
      final items = <Item>[];
      for (final doc in value.docs) {
        items.add(Item.fromJson(doc.data()! as Map<String, dynamic>));
      }
      return items;
    });
  }

  /// GET [Item]s by tag
  Future<List<Item>> getByTag(String tag) {
    return _itemsCollection.where('tags', arrayContains: tag).get().then(
      (value) {
        final items = <Item>[];
        for (final doc in value.docs) {
          items.add(Item.fromJson(doc.data()! as Map<String, dynamic>));
        }
        return items;
      },
    );
  }

  /// GET [Item]s by name
  Future<List<Item>> getByName(String name) {
    return _itemsCollection
        .where('name', isGreaterThanOrEqualTo: name)
        .get()
        .then(
      (value) {
        final items = <Item>[];
        for (final doc in value.docs) {
          items.add(Item.fromJson(doc.data()! as Map<String, dynamic>));
        }
        return items;
      },
    );
  }

  /// Get [Item]s by search query
  Future<List<Item>> getByQuery(String query) async {
    final searchQuery = <Item>{};
    final tagsQuery = await getByTag(query);
    final nameQuery = await getByName(query);
    final categoryQuery = await getByCategory(query, 100);

    searchQuery
      ..addAll(tagsQuery)
      ..addAll(nameQuery)
      ..addAll(categoryQuery);

    return searchQuery.toList();
  }

  /// GET Home [Item]s
  Future<List<Item>> get() {
    return _itemsCollection.limit(6).get().then(
      (value) {
        final items = <Item>[];
        for (final doc in value.docs) {
          items.add(Item.fromJson(doc.data()! as Map<String, dynamic>));
        }
        return items;
      },
    );
  }
}
