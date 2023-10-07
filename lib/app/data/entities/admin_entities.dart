class AdminEntity {
  final int? id;
  final DateTime? createdAt;

  final String pw;
  final String username;

  AdminEntity({
    required this.username,
    this.id,
    this.createdAt,
    required this.pw,
  });

  factory AdminEntity.fromJson(Map<String, dynamic> json) => AdminEntity(
        username: json["name"],
        pw: json["pw"],
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "pw": pw,
        "id": id,
        "created_at": createdAt!.toIso8601String(),
      };

  static AdminEntity empty() {
    return AdminEntity(
      id: null,
      pw: '',
      username: '',
      createdAt: null,
    );
  }
}
