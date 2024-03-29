// ignore_for_file: strict_raw_type

/// [Assets] model
class Assets {
  /// [Assets] model
  Assets({
    required this.logo,
    required this.categories,
    required this.social,
    required this.coupons,
    required this.order,
  });

  /// Creates an [Assets] from a json
  factory Assets.fromJson(Map<String, dynamic> json) {
    return Assets(
      logo: json[logoKey] as String,
      social: json[socialKey] as Map<String, dynamic>,
      categories: json[categoriesKey] as List,
      coupons: json[couponsKey] as List,
      order: json[orderKey] as num,
    );
  }

  /// Creates an empty [Assets]
  Assets.empty()
      : this(
          logo: '',
          social: {},
          categories: [],
          coupons: [],
          order: 0,
        );

  /// The key for the logo
  static const String logoKey = 'logo';

  /// The key for the social
  static const String socialKey = 'social';

  /// The key for the categories
  static const String categoriesKey = 'categories';

  /// The key for the coupons
  static const String couponsKey = 'coupons';

  /// The key for the order
  static const String orderKey = 'order';

  /// The logo
  final String logo;

  /// The categories
  final List categories;

  /// The social
  final Map<String, dynamic> social;

  /// The coupons
  final List coupons;

  /// The order
  final num order;

  /// Converts the [Assets] to a json
  Map<String, dynamic> toJson() {
    return {
      logoKey: logo,
      socialKey: social,
      categoriesKey: categories,
      couponsKey: coupons,
      orderKey: order,
    };
  }

  /// Creates a copy of an [Assets]
  Assets copyWith({
    String? logo,
    List? categories,
    Map<String, dynamic>? social,
    List? coupons,
    int? order,
  }) {
    return Assets(
      logo: logo ?? this.logo,
      social: social ?? this.social,
      categories: categories ?? this.categories,
      coupons: coupons ?? this.coupons,
      order: order ?? this.order,
    );
  }
}
