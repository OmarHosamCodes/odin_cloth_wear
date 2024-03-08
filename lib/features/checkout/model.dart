import 'package:odin_cloth_wear/library.dart';

/// A class to represent a [Mail]

class Mail {
  /// [Mail] constructor
  Mail({
    required this.id,
    required this.items,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.governorates,
    this.discount,
  });

  /// [Mail] from json
  factory Mail.fromJson(Map<String, dynamic> json) {
    return Mail(
      id: json['id'] as String,
      items: (json['items'] as List)
          .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      address: json['address'] as String,
      governorates: json['governorates'] as String,
    );
  }

  /// [Mail] id
  final String id;

  /// [Mail] items
  final List<CartItem> items;

  /// [Mail] user name
  final String name;

  /// [Mail] phone number
  final String phoneNumber;

  /// [Mail] address
  final String address;

  /// [Mail] governorates
  final String governorates;

  /// [Mail] Discount
  double? discount;

  /// [Mail] Total

  double get total {
    final total = items.fold<double>(
      0,
      (previousValue, element) =>
          previousValue + (element.price! * element.quantity),
    );

    return switch (discount) {
      5 => total * .95,
      10 => total * .90,
      15 => total * .85,
      20 => total * .80,
      25 => total * .75,
      30 => total * .70,
      35 => total * .65,
      40 => total * .60,
      45 => total * .55,
      50 => total * .50,
      55 => total * .45,
      60 => total * .40,
      65 => total * .35,
      70 => total * .30,
      75 => total * .25,
      80 => total * .20,
      85 => total * .15,
      90 => total * .10,
      95 => total * .5,
      100 => 0,
      _ => total,
    }
        .roundToDouble();
  }

  /// [Mail] to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'items': items.map((e) => e.toJson()).toList(),
      'name': name,
      'phoneNumber': phoneNumber,
      'address': address,
      'governorates': governorates,
      'total': total,
    };
  }

  /// [Mail] copy with
  Mail copyWith({
    String? id,
    List<CartItem>? items,
    String? name,
    String? phoneNumber,
    String? address,
    String? governorates,
    double? discount,
  }) {
    return Mail(
      id: id ?? this.id,
      items: items ?? this.items,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      governorates: governorates ?? this.governorates,
      discount: discount ?? this.discount,
    );
  }
}
