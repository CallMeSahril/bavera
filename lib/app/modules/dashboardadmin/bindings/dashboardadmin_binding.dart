import 'package:get/get.dart';

import '../controllers/dashboardadmin_controller.dart';

class DashboardadminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardadminController>(
      () => DashboardadminController(),
    );
  }
}
