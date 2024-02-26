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
  Future<(Item?, ResponseStatus)> getById(String? itemId) async {
    if (itemId == null) {
      return (null, ResponseStatus.error);
    } else {
      final snapshot = await _itemsCollection.doc(itemId).get();
      if (snapshot.exists) {
        return (
          Item.fromJson(snapshot.data()! as Map<String, dynamic>),
          ResponseStatus.success
        );
      } else {
        return (null, ResponseStatus.error);
      }
    }
  }

  /// GET [Item]s by category
  Future<List<Item>> getByCategory(String category) {
    return _itemsCollection
        .where('category', isLessThanOrEqualTo: category)
        .get()
        .then(
          (value) => value.docs
              .map((doc) => Item.fromJson(doc.data()! as Map<String, dynamic>))
              .toList(),
        );
  }

  /// GET [Item]s by tag
  Future<List<Item>> getByTag(String tag) {
    return _itemsCollection.where('tags', arrayContains: tag).get().then(
          (value) => value.docs
              .map((doc) => Item.fromJson(doc.data()! as Map<String, dynamic>))
              .toList(),
        );
  }

  /// GET [Item]s by name
  Future<List<Item>> getByName(String name) {
    return _itemsCollection.where('name', isLessThanOrEqualTo: name).get().then(
          (value) => value.docs
              .map((doc) => Item.fromJson(doc.data()! as Map<String, dynamic>))
              .toList(),
        );
  }

  /// Get [Item]s by search query
  Future<List<Item>> getByQuery(String query) async {
    final searchQuery = <Item>{};
    final tagsQuery = await getByTag(query);
    final nameQuery = await getByName(query);
    final categoryQuery = await getByCategory(query);

    searchQuery
      ..addAll(tagsQuery)
      ..addAll(nameQuery)
      ..addAll(categoryQuery);

    return searchQuery.toList();
  }

  /// GET [Item]s
  Future<List<Item>> get() {
    return _itemsCollection.get().then(
          (value) => value.docs
              .map((doc) => Item.fromJson(doc.data()! as Map<String, dynamic>))
              .toList(),
        );
  }
}
