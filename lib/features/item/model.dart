import '/library.dart';

/// A class to represent an item
class Item extends Equatable {
  /// Creates an [Item]
  const Item({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.price,
    required this.category,
    required this.colors,
    required this.sizes,
    required this.tags,
    required this.subCategory,
  });

  /// Creates an [Item] from a json
  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json[idKey],
        name: json[nameKey],
        description: json[descriptionKey],
        images: json[imagesKey],
        price: json[priceKey],
        category: json[categoryKey],
        subCategory: json[subCategoryKey],
        colors: json[colorsKey],
        sizes: json[sizesKey],
        tags: json[tagsKey],
      );

  /// Creates a copy of an [Item]
  Item copyWith({
    String? id,
    String? name,
    String? description,
    List<dynamic>? images,
    double? price,
    String? category,
    String? subCategory,
    List<dynamic>? colors,
    List<dynamic>? sizes,
    List<dynamic>? tags,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      images: images ?? this.images,
      price: price ?? this.price,
      category: category ?? this.category,
      subCategory: subCategory ?? this.subCategory,
      colors: colors ?? this.colors,
      sizes: sizes ?? this.sizes,
      tags: tags ?? this.tags,
    );
  }

  /// ID Refrence in the database
  static const String idKey = 'id';

  /// Name Refrence in the database
  static const String nameKey = 'name';

  /// Description Refrence in the database
  static const String descriptionKey = 'description';

  /// Images Refrence in the database
  static const String imagesKey = 'images';

  /// Price Refrence in the database
  static const String priceKey = 'price';

  /// Category Refrence in the database
  static const String categoryKey = 'category';

  /// SubCategory Refrence in the database
  static const String subCategoryKey = 'subCategory';

  /// Colors Refrence in the database
  static const String colorsKey = 'colors';

  /// Sizes Refrence in the database
  static const String sizesKey = 'sizes';

  /// Tags Refrence in the database
  static const String tagsKey = 'tags';

  /// ID of the [Item]
  final String? id;

  /// Name of the [Item]
  final String? name;

  /// Description of the [Item]
  final String? description;

  /// Images of the [Item]
  final List<dynamic>? images;

  /// Price of the [Item]
  final double? price;

  /// Category of the [Item]
  final String? category;

  /// SubCategory of the [Item]
  final String? subCategory;

  /// Colors of the [Item]
  final List<dynamic>? colors;

  /// Sizes of the [Item]
  final List<dynamic>? sizes;

  /// Tags of the [Item]
  final List<dynamic>? tags;

  /// Converts an [Item] to a json
  Map<String, dynamic> toJson() => {
        idKey: id,
        nameKey: name,
        descriptionKey: description,
        imagesKey: images,
        priceKey: price,
        categoryKey: category,
        subCategoryKey: subCategory,
        colorsKey: colors,
        sizesKey: sizes,
        tagsKey: tags,
      };

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        images,
        price,
        category,
        subCategory,
        colors,
        sizes,
        tags,
      ];
}

class ItemNotifer extends StateNotifier<Item> {
  ItemNotifer(Item state) : super(state);

  void update(Item item) {
    state = item;
  }
}
