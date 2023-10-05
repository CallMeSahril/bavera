import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GameController extends GetxController {
  //TODO: Implement GameController
  TextEditingController nameSatuController = TextEditingController();
  TextEditingController nameDuaController = TextEditingController();
  TextEditingController nameTigaController = TextEditingController();
  TextEditingController nameEmpatController = TextEditingController();
  var selectedItem = RxString('Lapangan 1');
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
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
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
    isLoading.value = true;
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
    isLoading.value = false;
  }

  void resetAllValues() {
    resetValueOne();
    resetValueTwo();
    resetValueKok();
  }
}
