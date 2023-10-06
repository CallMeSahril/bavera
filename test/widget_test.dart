import 'dart:convert';

import 'package:bavera/app/data/entities/match_entities.dart';
import 'package:bavera/app/data/entities/pay_entities.dart';
import 'package:bavera/app/data/entities/user.dart';
import 'package:bavera/app/data/repositories/bavera_repository.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  test("test username match id", () async {
    final baveraRepo = BaveraRepository();
    var name = ('sahril');
    List<MatchEntity> listMatch = await baveraRepo.matchListAll();
    List<MatchEntity> listMatchUserName = listMatch!.where(
      (result) {
        return result.nameSatu.toLowerCase() == name.toLowerCase() ||
            result.nameDua.toLowerCase() == name.toLowerCase() ||
            result.nameTiga.toLowerCase() == name.toLowerCase() ||
            result.nameEmpat.toLowerCase() == name.toLowerCase();
      },
    ).toList();
    for (var element in listMatchUserName!) {
      if (element.nameSatu.toLowerCase() == name.toLowerCase()) {
        print(element.nameSatu);
      } else if (element.nameDua.toLowerCase() == name.toLowerCase()) {
        print(element.nameDua);
      } else if (element.nameTiga.toLowerCase() == name.toLowerCase()) {
        print(element.nameTiga);
      } else if (element.nameEmpat.toLowerCase() == name.toLowerCase()) {
        print(element.nameEmpat);
      }
    }
  });

  test("test username payment id", () async {
    final baveraRepo = BaveraRepository();
    var name = ('doni');
    List<PayEntity> result = await baveraRepo.findById(name);

    print(result);
  });
  test('update paymanet', () async {
    final baveraRepo = BaveraRepository();
    bool postPayment =
        await baveraRepo.updatePayment(userName: 'sahril', name: [
      'sahril',
    ], kok: [
      0,
      1
    ]);
    print(postPayment);
  });
  test('insert paymanet', () async {
    final baveraRepo = BaveraRepository();
    bool postPayment = await baveraRepo.postPayment(
        userName: 'sahril', name: ['sahril', 'sahril'], kok: [0, 1]);
    print(postPayment);
  });
  test('update', () async {
    final baveraRepo = BaveraRepository();
    bool updatePay = await baveraRepo
        .updatePayment(userName: 'sahril', name: ["sahril"], kok: [1]);
  });
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
    String singleNames = "";

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
    singleNames = allNames[0];

    print(allNames);
    print(singleNames);
  });

  test('Payment LIST ALL', () async {
    final baveraRepository = BaveraRepository();
    String nameToFind = "doni"; // Ganti dengan nama yang ingin Anda cari
    int? foundId;
    List<PayEntity> resultUser = await baveraRepository.paymentListAll();
    for (var entity in resultUser) {
      if (entity.name[0] == nameToFind) {
        // Ganti "name" dengan nama properti yang sesuai di objek PayEntity
        foundId = entity
            .id; // Ganti "id" dengan nama properti ID yang sesuai di objek PayEntity
        break; // Keluar dari perulangan setelah menemukan yang cocok pertama
      }
    }

    if (foundId != null) {
      print('ID untuk $nameToFind adalah $foundId');
    } else {
      print('Tidak ada entitas dengan nama $nameToFind');
    }
    print(jsonEncode(resultUser!.first.toJson()));
  });
}
