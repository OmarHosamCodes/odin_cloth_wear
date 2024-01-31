import '/library.dart';

final adminAssetsProvider = FutureProvider<AdminAssets>((ref) {
  final adminRef = FirebaseFirestore.instance.collection('admin').doc('assets');
  final admin = adminRef.get().then((value) {
    return AdminAssets.fromJson(value.data()!);
  });

  return admin;
});
