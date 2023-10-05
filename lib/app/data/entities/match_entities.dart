class MatchEntity {
  final int? id;
  final DateTime? createdAt;
  final String nameSatu;
  final String nameDua;
  final String nameTiga;
  final String nameEmpat;
  final int skorTeamSatu;
  final int skorTeamDua;
  final int kok;
  final int lapangan;

  MatchEntity({
    this.id,
    this.createdAt,
    required this.nameSatu,
    required this.nameDua,
    required this.nameTiga,
    required this.nameEmpat,
    required this.skorTeamSatu,
    required this.skorTeamDua,
    required this.kok,
    required this.lapangan,
  });
  factory MatchEntity.fromJson(Map<String, dynamic> json) => MatchEntity(
        nameSatu: json["name_satu"],
        nameDua: json["name_dua"],
        nameTiga: json["nama_tiga"],
        nameEmpat: json["nama_empat"],
        kok: json["kok"],
        skorTeamSatu: json["skor_team_satu"],
        skorTeamDua: json["skor_team_dua"],
        lapangan: json["lapangan"],
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "name_satu": nameSatu,
        "name_dua": nameDua,
        "nama_tiga": nameTiga,
        "nama_empat": nameEmpat,
        "kok": kok,
        "skor_team_satu": skorTeamSatu,
        "skor_team_dua": skorTeamDua,
        "lapangan": lapangan,
        "id": id,
        "created_at": createdAt!.toIso8601String(),
      };
}
