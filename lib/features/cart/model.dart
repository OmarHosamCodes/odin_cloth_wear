import 'package:odin_cloth_wear/library.dart';

part 'model.g.dart';

@HiveType(typeId: 0)

/// A class that represents a cart item.
class CartItem {
  /// Creates an [CartItem]
  const CartItem({
    required this.id,
    required this.color,
    required this.size,
  });

  /// ID Refrence in the database
  static const String idKey = 'id';

  /// Name Refrence in the database
  static const String nameKey = 'name';

  /// Colors Refrence in the database
  static const String colorsKey = 'colors';

  /// Sizes Refrence in the database
  static const String sizesKey = 'sizes';

  /// ID of the [CartItem]
  @HiveField(0)
  final String? id;

  /// Colors of the [CartItem]
  @HiveField(1)
  final int? color;

  /// Sizes of the [CartItem]
  @HiveField(2)
  final String? size;
}
