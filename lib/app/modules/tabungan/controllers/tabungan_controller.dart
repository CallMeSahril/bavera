import 'package:bavera/app/data/entities/tabungan_entities.dart';
import 'package:bavera/app/data/repositories/bavera_repository.dart';
import 'package:get/get.dart';

class TabunganController extends GetxController {
  //TODO: Implement TabunganController
  RxBool isLoading = false.obs;
  List<TabunganEntity>? listTabungan;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getTabunganList();
  }

  Future getTabunganList({String? name}) async {
    isLoading.value = true;

    final baveraRepo = BaveraRepository();
    var listPayMentResult = await baveraRepo.usersTabunganAll();
    print(listPayMentResult.length);
    if (name != null) {
      listTabungan = listPayMentResult
          .where((element) => element.username == name)
          .toList();
    } else {
      listTabungan = listPayMentResult;
    }
    isLoading.value = false;
  }
}
