import 'package:odin_cloth_wear/library.dart';

/// Provider for the [CartRepository] class.
final cartRepositoryProvider = Provider<CartRepository>(
  (ref) => CartRepository(),
);

/// Provider for the stream of [List<CartItem>].
final cartProvider = StreamProvider<List<CartItem>>(
  (ref) async* {
    final cartRepo = ref.read(cartRepositoryProvider);
    yield* cartRepo.get().asStream();
  },
);
