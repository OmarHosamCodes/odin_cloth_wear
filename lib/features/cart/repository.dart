import '/library.dart';

/// A repository for [CartItem] with hive db

class CartRepository {
  /// [CartRepository] constructor
  CartRepository();

  /// GET [CartItem]
  Future<List<CartItem>> get() async {
    final box = await Hive.openBox<CartItem>('cart');
    final cart = box.values.toList();
    return cart;
  }

  /// ADD [CartItem]

  Future<(CartItem?, ResponseStatus)> add(
      String itemID, int color, String size) async {
    final box = await Hive.openBox<CartItem>('cart');
    final itemRepository = ItemRepository(FirebaseFirestore.instance);
    final item = (await itemRepository.getById(itemID)).$1; //add null check
    if (item != null) {
      final cartItem = CartItem(
        id: item.id,
        color: color,
        size: size,
      );
      await box.put(item.id, cartItem);
      return (cartItem, ResponseStatus.success);
    } else {
      return (null, ResponseStatus.error);
    }
  }

  /// PUT [CartItem]
  Future<(CartItem?, ResponseStatus)> update(CartItem cartItem) async {
    final box = await Hive.openBox<CartItem>('cart');
    if (box.get(cartItem.id) != null) {
      await box.put(cartItem.id, cartItem);
      return (cartItem, ResponseStatus.success);
    } else {
      return (null, ResponseStatus.error);
    }
  }

  /// DELETE [CartItem]
  Future<ResponseStatus> delete(String id) async {
    final box = await Hive.openBox<CartItem>('cart');
    await box.delete(id);
    if (box.get(id) != null) {
      return (ResponseStatus.error);
    } else {
      return (ResponseStatus.success);
    }
  }
}
