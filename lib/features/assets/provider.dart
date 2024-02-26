import 'package:odin_cloth_wear/library.dart';

/// A provider that provides the assets repository.
final assetsRepositoryProvider = Provider<AssetsRepository>((ref) {
  return AssetsRepository();
});

/// A provider that provides the assets.
final assetsProvider = FutureProvider<Assets>((ref) async {
  return ref.read(assetsRepositoryProvider).get();
});
