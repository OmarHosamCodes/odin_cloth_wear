// ignore_for_file: strict_raw_type

/// [Assets] model
class Assets {
  /// [Assets] model
  Assets({
    required this.logo,
    required this.categories,
    required this.social,
  });

  /// Creates an [Assets] from a json
  factory Assets.fromJson(Map<String, dynamic> json) {
    return Assets(
      logo: json[logoKey] as String,
      social: json[socialKey] as Map<String, dynamic>,
      categories: json[categoriesKey] as List,
    );
  }

  /// Creates an empty [Assets]
  Assets.empty()
      : this(
          logo: '',
          social: {},
          categories: [],
        );

  /// The key for the logo
  static const String logoKey = 'logo';

  /// The key for the social
  static const String socialKey = 'social';

  /// The key for the categories
  static const String categoriesKey = 'categories';

  /// The logo
  final String logo;

  /// The categories
  final List categories;

  /// The social
  final Map<String, dynamic> social;

  /// Converts the [Assets] to a json
  Map<String, dynamic> toJson() {
    return {
      logoKey: logo,
      socialKey: social,
    };
  }

  /// Creates a copy of an [Assets]
  Assets copyWith({
    String? logo,
    List? categories,
    Map<String, dynamic>? social,
  }) {
    return Assets(
      logo: logo ?? this.logo,
      social: social ?? this.social,
      categories: categories ?? this.categories,
    );
  }
}
