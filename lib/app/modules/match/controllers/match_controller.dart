import 'package:bavera/app/data/entities/match_entities.dart';
import 'package:bavera/app/data/entities/pay_entities.dart';
import 'package:bavera/app/data/repositories/bavera_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MatchController extends GetxController {
  List<MatchEntity>? listMatch;
  List<PayEntity>? listPayment;

  RxBool isLoading = false.obs;
  TextEditingController nameController = TextEditingController();

  var selectedItem = RxString('All');

  @override
  void onInit() {
    super.onInit();
    getMatch();
  }

  void onItemSelected(String? value) {
    selectedItem.value = value!;
    getMatch();
  }

  @override
  // TODO: implement onStart
  InternalFinalCallback<void> get onStart => super.onStart;

  Future getMatch({String? name}) async {
    isLoading.value = true;

    final baveraRepo = BaveraRepository();
    var listMatchResult = await baveraRepo.matchListAll();

    if (name == null) {
      listMatch = listMatchResult.where(
        (result) {
          if (selectedItem.value == "Lapangan 1") {
            return result.lapangan == 1;
          } else if (selectedItem.value == "Lapangan 2") {
            return result.lapangan == 2;
          } else if (selectedItem.value == "Lapangan 3") {
            return result.lapangan == 3;
          } else {
            return result.lapangan == 3 ||
                result.lapangan == 1 ||
                result.lapangan == 2;
          }
        },
      ).toList();
    } else {
      listMatch = listMatchResult.where(
        (result) {
          if (selectedItem.value == "Lapangan 1") {
            return result.lapangan == 1 &&
                    result.nameSatu.toLowerCase() == name.toLowerCase() ||
                result.nameDua.toLowerCase() == name.toLowerCase() ||
                result.nameTiga.toLowerCase() == name.toLowerCase() ||
                result.nameEmpat.toLowerCase() == name.toLowerCase();
          } else if (selectedItem.value == "Lapangan 2") {
            return result.lapangan == 2 &&
                    result.nameSatu.toLowerCase() == name.toLowerCase() ||
                result.nameDua.toLowerCase() == name.toLowerCase() ||
                result.nameTiga.toLowerCase() == name.toLowerCase() ||
                result.nameEmpat.toLowerCase() == name.toLowerCase();
          } else if (selectedItem.value == "Lapangan 3") {
            return result.lapangan == 3 &&
                    result.nameSatu.toLowerCase() == name.toLowerCase() ||
                result.nameDua.toLowerCase() == name.toLowerCase() ||
                result.nameTiga.toLowerCase() == name.toLowerCase() ||
                result.nameEmpat.toLowerCase() == name.toLowerCase();
          } else {
            return result.nameSatu.toLowerCase() == name.toLowerCase() ||
                result.nameDua.toLowerCase() == name.toLowerCase() ||
                result.nameTiga.toLowerCase() == name.toLowerCase() ||
                result.nameEmpat.toLowerCase() == name.toLowerCase();
          }
        },
      ).toList();
    }
    print(listMatch!.length);
    isLoading.value = false;
  }
}
