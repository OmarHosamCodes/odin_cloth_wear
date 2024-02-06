import 'package:odin_cloth_wear/library.dart';

final cartRepositoryProvider = Provider<CartRepository>(
  (ref) => CartRepository(),
);

final cartProvider = StreamProvider<List<CartItem>>(
  (ref) async* {
    final cartRepo = ref.read(cartRepositoryProvider);
    yield* cartRepo.get().asStream();
  },
);
