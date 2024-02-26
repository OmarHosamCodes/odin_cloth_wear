import 'package:odin_cloth_wear/library.dart';

/// A class to represent an [AssetsRepository]

class AssetsRepository {
  /// [FirebaseFirestore] instance
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  /// [Assets]s collection
  static const String collection = 'admin';

  /// [Assets]s collection
  static const String document = 'assets';

  /// [Assets]s collection
  DocumentReference<Map<String, dynamic>> get _assetsCollection =>
      firestore.collection(collection).doc(document);

  /// GET [Assets]s
  Future<Assets> get() {
    final assets = _assetsCollection.get().then((value) {
      return Assets.fromJson(value.data()!);
    });
    return assets;
  }
}
