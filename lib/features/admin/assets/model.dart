class AdminAssets {
  AdminAssets({
    required this.logo,
    required this.categories,
    required this.backgroundImages,
    required this.social,
  });

  static const String logoKey = 'logo';
  static const String categoriesKey = 'categories';
  static const String backgroundImagesKey = 'backgroundImages';
  static const String socialKey = 'social';

  final String logo;
  final List categories;
  final List backgroundImages;
  final Map<String, dynamic> social;

  factory AdminAssets.fromJson(Map<String, dynamic> json) {
    return AdminAssets(
      logo: json[logoKey] as String,
      categories: json[categoriesKey] as List,
      backgroundImages: json[backgroundImagesKey] as List,
      social: json[socialKey] as Map<String, dynamic>,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      logoKey: logo,
      categoriesKey: categories,
      backgroundImagesKey: backgroundImages,
      socialKey: social,
    };
  }

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

  AdminAssets.empty()
      : this(
          logo: '',
          categories: [],
          backgroundImages: [],
          social: {},
        );
}
