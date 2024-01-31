class AdminAssets {
  AdminAssets({
    required this.logo,
    required this.categories,
    required this.backgroundImages,
  });

  static const String logoKey = 'logo';
  static const String categoriesKey = 'categories';
  static const String backgroundImagesKey = 'backgroundImages';

  final String logo;
  final List categories;
  final List backgroundImages;

  factory AdminAssets.fromJson(Map<String, dynamic> json) {
    return AdminAssets(
        logo: json[logoKey] as String,
        categories: json[categoriesKey] as List,
        backgroundImages: json[backgroundImagesKey] as List);
  }

  Map<String, dynamic> toJson() {
    return {
      logoKey: logo,
      categoriesKey: categories,
      backgroundImagesKey: backgroundImages
    };
  }

  AdminAssets copyWith({
    String? logo,
    List? categories,
    List? backgroundImages,
  }) {
    return AdminAssets(
      logo: logo ?? this.logo,
      categories: categories ?? this.categories,
      backgroundImages: backgroundImages ?? this.backgroundImages,
    );
  }

  AdminAssets.empty() : this(logo: '', categories: [], backgroundImages: []);
}
