class PayEntity {
  final int? id;
  final DateTime? createdAt;
  final List<String> name;
  final List<int> kok;
  final List<int> lapangan;

  PayEntity({
    this.id,
    this.createdAt,
    required this.name,
    required this.kok,
    required this.lapangan,
  });
  // factory MatchEntity.fromJson(Map<String, dynamic> json) => MatchEntity(
  //       nameSatu: json["name_satu"],

  //       kok: json["kok"],

  //       lapangan: json["lapangan"],
  //       id: json["id"],
  //       createdAt: DateTime.parse(json["created_at"]),
  //     );

  // Map<String, dynamic> toJson() => {
  //       "name_satu": nameSatu,

  //       "kok": kok,

  //       "lapangan": lapangan,
  //       "id": id,
  //       "created_at": createdAt!.toIso8601String(),
  //     };
}
