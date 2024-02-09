// import '/library.dart';

// /// A class to represent an [AdminAssetsRepository]

// class AdminAssetsRepository {
//   /// [FirebaseFirestore] instance
//   FirebaseFirestore get firestore => FirebaseFirestore.instance;

//   /// [AdminAssets]s collection
//   static const String collection = 'admin';

//   static const String document = 'assets';

//   /// [AdminAssets]s collection
//   DocumentReference get _itemsCollection => firestore.collection(collection)
// .doc(document);

//   /// POST [AdminAssets]
//   Future<ResponseStatus> post(AdminAssets item) async {
//     try {
//       await _itemsCollection.add(item.toJson());
//       return ResponseStatus.success;
//     } catch (e) {
//       return ResponseStatus.error;
//     }
//   }

//   /// PUT [AdminAssets]
//   Future<ResponseStatus> put(AdminAssets item) async {
//     try {
//       await _itemsCollection.doc(item.id!).update(item.toJson());
//       return ResponseStatus.success;
//     } catch (e) {
//       return ResponseStatus.error;
//     }
//   }

//   /// DELETE [AdminAssets]
//   Future<ResponseStatus> delete(String itemId) async {
//     try {
//       await _itemsCollection.doc(itemId).delete();
//       return ResponseStatus.success;
//     } catch (e) {
//       return ResponseStatus.error;
//     }
//   }

//   /// GET [AdminAssets] by id
//   Future<(AdminAssets?, ResponseStatus)> getById(String itemId) async {
//     final snapshot = await _itemsCollection.doc(itemId).get();
//     if (snapshot.exists) {
//       return (
//         AdminAssets.fromJson(snapshot.data()! as Map<String, dynamic>),
//         ResponseStatus.success
//       );
//     } else {
//       return (null, ResponseStatus.error);
//     }
//   }

//   /// GET [AdminAssets]s
//   Future<List<AdminAssets>> get() {
//     return _itemsCollection.get().then((value) => value.docs
//         .map((doc) => AdminAssets.fromJson(doc.data()!
// as Map<String, dynamic>))
//         .toList());
//   }
// }
