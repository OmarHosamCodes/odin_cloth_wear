import 'package:odin_cloth_wear/library.dart';

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
    String itemID,
    int color,
    String size,
  ) async {
    final box = await Hive.openBox<CartItem>('cart');
    final itemRepository = ItemRepository(FirebaseFirestore.instance);
    final item = await itemRepository.getById(itemID); //add null check
    if (item != null) {
      final cartItem = CartItem(
        id: item.id,
        color: color,
        size: size,
        price: item.price,
        name: item.name,
      );
      await box.put(item.id, cartItem);
      return (cartItem, ResponseStatus.success);
    } else {
      return (null, ResponseStatus.error);
    }
  }

  /// INCREMENT [CartItem]
  Future<void> increment(String id) async {
    final box = await Hive.openBox<CartItem>('cart');
    final cartItem = box.get(id);
    if (cartItem != null) {
      cartItem.quantity++;
      await box.put(id, cartItem);
    }
  }

  /// DECREMENT [CartItem]
  Future<void> decrement(String id) async {
    final box = await Hive.openBox<CartItem>('cart');
    final cartItem = box.get(id);
    if (cartItem!.quantity > 1) {
      cartItem.quantity--;
      await box.put(id, cartItem);
    }
  }

  /// DELETE [CartItem]
  Future<void> delete(String id) async {
    final box = await Hive.openBox<CartItem>('cart');
    await box.delete(id);
  }
}
