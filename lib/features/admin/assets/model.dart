// ignore_for_file: strict_raw_type

/// [AdminAssets] model
class AdminAssets {
  /// [AdminAssets] model
  AdminAssets({
    required this.logo,
    required this.categories,
    required this.backgroundImages,
    required this.social,
  });

  /// Creates an [AdminAssets] from a json
  factory AdminAssets.fromJson(Map<String, dynamic> json) {
    return AdminAssets(
      logo: json[logoKey] as String,
      categories: json[categoriesKey] as List,
      backgroundImages: json[backgroundImagesKey] as List,
      social: json[socialKey] as Map<String, dynamic>,
    );
  }

  /// Creates an empty [AdminAssets]
  AdminAssets.empty()
      : this(
          logo: '',
          categories: [],
          backgroundImages: [],
          social: {},
        );

  /// The key for the logo
  static const String logoKey = 'logo';

  /// The key for the categories
  static const String categoriesKey = 'categories';

  /// The key for the background images
  static const String backgroundImagesKey = 'backgroundImages';

  /// The key for the social
  static const String socialKey = 'social';

  /// The logo
  final String logo;

  /// The categories
  final List categories;

  /// The background images
  final List backgroundImages;

  /// The social
  final Map<String, dynamic> social;

  /// Converts the [AdminAssets] to a json
  Map<String, dynamic> toJson() {
    return {
      logoKey: logo,
      categoriesKey: categories,
      backgroundImagesKey: backgroundImages,
      socialKey: social,
    };
  }

  /// Creates a copy of an [AdminAssets]
  AdminAssets copyWith({
    String? logo,
    List? categories,
    List? backgroundImages,
    Map<String, dynamic>? social,
  }) {
    return AdminAssets(
      logo: logo ?? this.logo,
      categories: categories ?? this.categories,
      backgroundImages: backgroundImages ?? this.backgroundImages,
      social: social ?? this.social,
    );
  }
}
