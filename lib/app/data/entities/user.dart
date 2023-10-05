class UserEntity {
  final int id;
  final DateTime createdAt;
  final String name;

  UserEntity({
    required this.name,
    required this.id,
    required this.createdAt,
  });
  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        name: json["name"],
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "created_at": createdAt.toIso8601String(),
      };

  static Stream<UserEntity> fromStream(Stream<Map<String, dynamic>> stream) {
    return stream.map((map) => UserEntity.fromJson(map));
  }
}
