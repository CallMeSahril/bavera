import 'package:get/get.dart';

import '../controllers/detailreport_controller.dart';

class DetailreportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailreportController>(
      () => DetailreportController(),
    );
  }
}
