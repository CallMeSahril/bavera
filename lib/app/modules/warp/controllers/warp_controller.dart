import 'package:bavera/app/core/services/local_db.dart';
import 'package:bavera/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WarpController extends GetxController {
  final currentPage = 0.obs;

  @override
  void onReady() {
    _init();
    super.onReady();
  }

  @override
  void onInit() {
    _init();
    super.onInit();
  }
}

void _init() {
  Future.delayed(const Duration(seconds: 3), () {
    if (LocalDb.loggedIn) {
      print("ini login ${LocalDb.loggedIn}");
      if (LocalDb.loggedIn) {
        Get.offAllNamed(Routes.DASHBOARDADMIN);
      } else {
        Get.offAllNamed(Routes.DASHBOARD);
      }
    } else {
      Get.offAllNamed(Routes.DASHBOARD);
    }
  });
}
