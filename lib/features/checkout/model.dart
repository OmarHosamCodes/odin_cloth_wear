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
    this.docId,
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
      governorates: json['governorates'] as Governorate,
      docId: json['docId'] as String?,
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
  final Governorate governorates;

  /// [Mail] doc ic
  String? docId;

  /// [Mail] discount
  double? discount;

  /// [Mail] total
  double get total {
    final total = items.fold<double>(
      0,
      (previousValue, element) =>
          previousValue + (element.price! * element.quantity),
    );
    final deliveryCost = governorates.deliveryCost ?? 0.0;

    return switch (discount) {
      5 => (total * .95) + deliveryCost,
      10 => (total * .90) + deliveryCost,
      15 => (total * .85) + deliveryCost,
      20 => (total * .80) + deliveryCost,
      25 => (total * .75) + deliveryCost,
      30 => (total * .70) + deliveryCost,
      35 => (total * .65) + deliveryCost,
      40 => (total * .60) + deliveryCost,
      45 => (total * .55) + deliveryCost,
      50 => (total * .50) + deliveryCost,
      55 => (total * .45) + deliveryCost,
      60 => (total * .40) + deliveryCost,
      65 => (total * .35) + deliveryCost,
      70 => (total * .30) + deliveryCost,
      75 => (total * .25) + deliveryCost,
      80 => (total * .20) + deliveryCost,
      85 => (total * .15) + deliveryCost,
      90 => (total * .10) + deliveryCost,
      95 => (total * .5) + deliveryCost,
      100 => 0 + deliveryCost,
      _ => total + deliveryCost,
    }
        .roundToDouble();
  }

  /// [Mail] items total
  double get itemsTotal {
    final total = items
        .fold<double>(
          0,
          (previousValue, element) =>
              previousValue + (element.price! * element.quantity),
        )
        .roundToDouble();
    return total;
  }

  /// [Mail] to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'items': items.map((e) => e.toJson()).toList(),
      'name': name,
      'phoneNumber': phoneNumber,
      'address': address,
      'governorates': governorates.name,
      'total': total,
      'docId': docId,
    };
  }

  /// [Mail] copy with
  Mail copyWith({
    String? id,
    List<CartItem>? items,
    String? name,
    String? phoneNumber,
    String? address,
    Governorate? governorates,
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
