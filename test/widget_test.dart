import 'dart:convert';

import 'package:bavera/app/data/entities/match_entities.dart';
import 'package:bavera/app/data/entities/user.dart';
import 'package:bavera/app/data/repositories/bavera_repository.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CLIENT LIST ALL', () async {
    var name = "sahril";
    var kok = 0;
    List<MatchEntity> resultKok = [];
    List<int> kokList = [];
    final baveraRepository = BaveraRepository();
    List<MatchEntity> resultUser = await baveraRepository.matchListAll();
    resultKok = resultUser.where((result) {
      return result.nameSatu.toLowerCase() == name.toLowerCase() ||
          result.nameDua.toLowerCase() == name.toLowerCase() ||
          result.nameTiga.toLowerCase() == name.toLowerCase() ||
          result.nameEmpat.toLowerCase() == name.toLowerCase();
    }).toList();
    for (var element in resultKok) {
      kokList.add(element.kok);
    }
    int sumKok =
        kokList.fold(0, (previousValue, element) => previousValue + element);
    print(sumKok);
    print(kokList);
    print(jsonEncode(resultUser!.first.toJson()));
  });

  test('nama LIST ALL', () async {
    var name = "sahril";
    List<String> allNames = [];
    final baveraRepository = BaveraRepository();
    List<MatchEntity> resultUser = await baveraRepository.matchListAll();

    List<String> namaSatu = resultUser
        .where((result) => result.nameSatu.toLowerCase() == name.toLowerCase())
        .map((result) => result.nameSatu)
        .toList();
    List<String> namaDua = resultUser
        .where((result) => result.nameDua.toLowerCase() == name.toLowerCase())
        .map((result) => result.nameDua)
        .toList();
    List<String> namaTiga = resultUser
        .where((result) => result.nameTiga.toLowerCase() == name.toLowerCase())
        .map((result) => result.nameTiga)
        .toList();
    List<String> namaEmpat = resultUser
        .where((result) => result.nameEmpat.toLowerCase() == name.toLowerCase())
        .map((result) => result.nameEmpat)
        .toList();

    allNames.addAll(namaSatu);
    allNames.addAll(namaDua);
    allNames.addAll(namaTiga);
    allNames.addAll(namaEmpat);
    print(allNames);
  });
}
