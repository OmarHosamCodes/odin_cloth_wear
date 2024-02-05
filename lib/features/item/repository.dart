import '/library.dart';

/// A class to represent an [ItemRepository]

class ItemRepository {
  /// [ItemRepository] constructor
  ItemRepository(
    this.firestore,
  );

  /// [FirebaseFirestore] instance
  final FirebaseFirestore firestore;

  static get instance => ItemRepository(FirebaseFirestore.instance);

  /// [Item]s collection
  static const String collection = 'items';

  /// [Item]s collection
  CollectionReference get _itemsCollection => firestore.collection(collection);

  /// POST [Item]
  Future<ResponseStatus> post(Item item) async {
    try {
      await _itemsCollection.add(item.toJson());
      return ResponseStatus.success;
    } catch (e) {
      return ResponseStatus.error;
    }
  }

  /// PUT [Item]
  Future<ResponseStatus> put(Item item) async {
    try {
      await _itemsCollection.doc(item.id!).update(item.toJson());
      return ResponseStatus.success;
    } catch (e) {
      return ResponseStatus.error;
    }
  }

  /// DELETE [Item]
  Future<ResponseStatus> delete(String itemId) async {
    try {
      await _itemsCollection.doc(itemId).delete();
      return ResponseStatus.success;
    } catch (e) {
      return ResponseStatus.error;
    }
  }

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

  /// GET [Item]s
  Future<List<Item>> get() {
    return _itemsCollection.get().then((value) => value.docs
        .map((doc) => Item.fromJson(doc.data()! as Map<String, dynamic>))
        .toList());
  }
}
