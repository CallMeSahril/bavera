class TabunganEntity {
  final int? id;
  final DateTime? createdAt;
  final List<int> duit;
  final String username;

  TabunganEntity({
    required this.username,
    this.id,
    this.createdAt,
    required this.duit,
  });

  factory TabunganEntity.fromJson(Map<String, dynamic> json) => TabunganEntity(
        duit: List<int>.from(json["duit"].map((x) => x)),
        username: json["name"],
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "duit": List<dynamic>.from(duit.map((x) => x)),
        "name": username,
        "id": id,
        "created_at": createdAt!.toIso8601String(),
      };
}
