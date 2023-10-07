class PayEntity {
  final int? id;
  final DateTime? createdAt;
  final List<String> name;
  final List<int> kok;
  final int price;
  final String username;
  final bool ket;

  PayEntity({
    required this.username,
    required this.ket,
    this.id,
    this.createdAt,
    required this.name,
    required this.kok,
    required this.price,
  });

  factory PayEntity.fromJson(Map<String, dynamic> json) => PayEntity(
        name: List<String>.from(json["name"].map((x) => x)),
        kok: List<int>.from(json["kok"].map((x) => x)),
        price: json["price"],
        ket: json["ket"],
        username: json["username"],
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "name": List<dynamic>.from(name.map((x) => x)),
        "kok": List<dynamic>.from(kok.map((x) => x)),
        "price": price,
        "ket": ket,
        "username": price,
        "id": id,
        "created_at": createdAt!.toIso8601String(),
      };
}
