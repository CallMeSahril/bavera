import 'dart:ffi';

import 'package:bavera/app/data/entities/match_entities.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../data/entities/pay_entities.dart';
import '../../../data/repositories/bavera_repository.dart';

class GameController extends GetxController {
  //TODO: Implement GameController
  TextEditingController nameSatuController = TextEditingController();
  TextEditingController nameDuaController = TextEditingController();
  TextEditingController nameTigaController = TextEditingController();
  TextEditingController nameEmpatController = TextEditingController();
  var selectedItem = RxString('Lapangan 1');
  List<MatchEntity>? listMatchUserName;
  List<PayEntity>? listPayment;
  List<PayEntity>? listPaymentUserName = [];

  List<String> allNames = [];
  List<int> allKok = [];

  List<MatchEntity> listMatchResult = [];
  var isActiveTukar = true.obs;
  void onItemSelected(String? value) {
    selectedItem.value = value!;
  }

  void onTukar(bool value) {
    isActiveTukar.value = value;
  }

  final countTeamOne = 0.obs;
  final countTeamTwo = 0.obs;
  final countKOK = 0.obs;
  final isTukar = true.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    onClikFun();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void incrementOne() => countTeamOne.value++;
  void incrementTwo() => countTeamTwo.value++;
  void incrementKok() => countKOK.value++;

  void decrementOne() {
    if (countTeamOne.value > 0) {
      countTeamOne.value--;
    }
  }

  void decrementTwo() {
    if (countTeamTwo.value > 0) {
      countTeamTwo.value--;
    }
  }

  void decrementKok() {
    if (countKOK.value > 0) {
      countKOK.value--;
    }
  }

  resetValueKok() {
    countKOK.value = 0;
  }

  resetValueOne() {
    countTeamOne.value = 0;
  }

  resetValueTwo() {
    countTeamTwo.value = 0;
  }

  isTrue() {
    isTukar.value = true;
  }

  isLoadingOn(bool isLosding) {
    isLoading.value = isLosding;
    update();
  }

  onClikFun() async {
    final baveraRepo = BaveraRepository();
    listMatchResult = await baveraRepo.matchListAll();
    listPayment = await baveraRepo.paymentListAll();
  }

  Future getMatch({
    required String name,
  }) async {
    allNames = [];
    allKok = [];
    List<MatchEntity> listMatchUserName = listMatchResult!.where(
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
        allNames.add(element.nameSatu);
        allKok.add(element.kok);
      } else if (element.nameDua.toLowerCase() == name.toLowerCase()) {
        print(element.nameDua);
        allNames.add(element.nameDua);
        allKok.add(element.kok);
      } else if (element.nameTiga.toLowerCase() == name.toLowerCase()) {
        print(element.nameTiga);
        allNames.add(element.nameTiga);
        allKok.add(element.kok);
      } else if (element.nameEmpat.toLowerCase() == name.toLowerCase()) {
        print(element.nameEmpat);
        allNames.add(element.nameEmpat);
        allKok.add(element.kok);
      }
    }
    print("ini nama semua $allNames");
    print("ini kok semua $allKok");
  }

  addMatch({
    required String nameSatu,
    required String nameDua,
    required String nameTiga,
    required String nameEmpat,
    required int skorTeamSatu,
    required int skorTeamDua,
    required int kok,
    required int lapangan,
  }) async {
    await Supabase.instance.client.from('match').insert({
      'name_satu': nameSatu,
      'name_dua': nameDua,
      'nama_tiga': nameTiga,
      'nama_empat': nameEmpat,
      'skor_team_satu': skorTeamSatu,
      'skor_team_dua': skorTeamDua,
      'kok': kok,
      'lapangan': lapangan
    });
    final baveraRepo = BaveraRepository();
    listMatchResult = await baveraRepo.matchListAll();
  }

  addPayment({
    required String userName,
    required List<String> name,
    required List<int> kok,
  }) async {
    int price = 0;
    if (!userName.startsWith('@')) {
      price = 12000;
    }
    await Supabase.instance.client.from('payment').insert({
      'price': price,
      'username': userName,
      'name': name,
      'kok': kok,
    });
  }

  updatePayment({
    required List<String> name,
    required List<int> kok,
    required String userName,
  }) async {
    final baveraRepo = BaveraRepository();
    bool updatePay = await baveraRepo.updatePayment(
        userName: userName, name: name, kok: kok);
  }

  getFindByUserName(String username) async {
    final baveraRepo = BaveraRepository();
    listPaymentUserName = await baveraRepo.findById(username);
    print("listPaymentUserName ${listPaymentUserName!.isEmpty}");
  }

  void resetAllValues() {
    resetValueOne();
    resetValueTwo();
    resetValueKok();
  }
}
