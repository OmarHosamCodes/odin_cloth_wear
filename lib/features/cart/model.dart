import 'package:odin_cloth_wear/library.dart';

part 'model.g.dart';

@HiveType(typeId: 0)

/// A class that represents a cart item.
class CartItem {
  /// Creates an [CartItem]
  CartItem({
    required this.id,
    required this.color,
    required this.size,
    required this.price,
    required this.name,
    this.quantity = 1,
  });

  /// Converts a map to [CartItem]

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json[idKey] as String,
      color: json[colorsKey] as int,
      size: json[sizesKey] as String,
      price: json[priceKey] as double,
      name: json[nameKey] as String,
      quantity: json[quantityKey] as int,
    );
  }

  /// ID Refrence in the database
  static const String idKey = 'id';

  /// Name Refrence in the database
  static const String nameKey = 'name';

  /// Colors Refrence in the database
  static const String colorsKey = 'colors';

  /// Sizes Refrence in the database
  static const String sizesKey = 'sizes';

  /// Price Refrence in the database
  static const String priceKey = 'price';

  /// Quantity Refrence in the database
  static const String quantityKey = 'quantity';

  /// ID of the [CartItem]
  @HiveField(0)
  final String? id;

  /// Colors of the [CartItem]
  @HiveField(1)
  final int? color;

  /// Sizes of the [CartItem]
  @HiveField(2)
  final String? size;

  /// Price of the [CartItem]
  @HiveField(3)
  final double? price;

  /// Name of the [CartItem]
  @HiveField(4)
  final String? name;

  /// Quantity of the [CartItem]
  @HiveField(5)
  int quantity = 1;

  /// Converts [CartItem] to a map

  Map<String, dynamic> toJson() {
    return {
      idKey: id,
      colorsKey: color,
      sizesKey: size,
      priceKey: price,
      nameKey: name,
      quantityKey: quantity,
    };
  }
}
