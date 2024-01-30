import '/library.dart';

final firestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final itemsProvider = FutureProvider<List<Item>>((ref) {
  final itemsCollection = ref.watch(firestoreProvider).collection('items');
  final items = itemsCollection.get().then((snapshot) {
    return snapshot.docs.map((doc) => Item.fromJson(doc.data())).toList();
  });

  return items;
});
