// ignore_for_file: strict_raw_type

/// the [Category] class is a model class that represents a category
/// with its subcategories
class Category {
  /// [Category] model
  Category(this.name, this.subCategories);

  /// Creates a [Category] from a json
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      json['name'] as String,
      json['subCategories'] as List,
    );
  }

  /// The name of the category
  final String? name;

  /// The subcategories of the category
  final List? subCategories;

  /// Converts the [Category] to a json
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'subCategories': subCategories,
    };
  }
}
