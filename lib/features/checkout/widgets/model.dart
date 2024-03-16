// ignore_for_file: public_member_api_docs, sort_constructors_first
class Governorate {
  int? id;
  String? name;
  int? deliveryCost;
  Governorate({
    this.id,
    this.name,
    this.deliveryCost,
  });

  Governorate copyWith({
    int? id,
    String? name,
    int? deliveryCost,
  }) {
    return Governorate(
      id: id ?? this.id,
      name: name ?? this.name,
      deliveryCost: deliveryCost ?? this.deliveryCost,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'deliveryCost': deliveryCost ?? deliveryCost,
    };
  }

  factory Governorate.fromMap(Map<String, dynamic> map) {
    return Governorate(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      deliveryCost:
          map['deliveryCost'] != null ? map['deliveryCost'] as int : null,
    );
  }

  @override
  String toString() =>
      "Governorate(id: $id, name: '$name', deliveryCost: $deliveryCost)";
}
