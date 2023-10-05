import 'package:bavera/app/data/entities/match_entities.dart';
import 'package:bavera/app/data/repositories/bavera_repository.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MatchController extends GetxController {
  List<MatchEntity>? listMatch;
  RxBool isLoading = false.obs;
  var selectedItem = RxString('Lapangan 1');

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

  Future getMatch() async {
    isLoading.value = true;

    final baveraRepo = BaveraRepository();
    var listMatchResult = await baveraRepo.matchListAll();

    listMatch = listMatchResult.where(
      (result) {
        if (selectedItem.value == "Lapangan 1") {
          return result.lapangan == 1;
        } else if (selectedItem.value == "Lapangan 2") {
          return result.lapangan == 2;
        } else {
          return result.lapangan == 3;
        }
      },
    ).toList();
    print(listMatch!.length);
    isLoading.value = false;
  }
}
