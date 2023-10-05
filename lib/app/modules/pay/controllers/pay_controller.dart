import 'package:bavera/app/data/entities/match_entities.dart';
import 'package:bavera/app/data/repositories/bavera_repository.dart';
import 'package:get/get.dart';

import '../../../data/entities/pay_entities.dart';

class PayController extends GetxController {
  List<MatchEntity>? listMatch;
  List<PayEntity>? listPayMent;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getMatch('Sahril');
  }

  @override
  // TODO: implement onStart
  InternalFinalCallback<void> get onStart => super.onStart;

  Future getMatch(String name) async {
    isLoading.value = true;

    final baveraRepo = BaveraRepository();
    var listMatchResult = await baveraRepo.matchListAll();
    listMatch = listMatchResult;

    print(listMatch!.length);
    isLoading.value = false;
  }

  void namaTidakBolehDoble(List<MatchEntity> listMatch) {
    // Buat list untuk menyimpan nama yang unik

    for (var element in listMatch) {}
  }
}
