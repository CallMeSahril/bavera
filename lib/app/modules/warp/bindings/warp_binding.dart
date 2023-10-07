import 'package:get/get.dart';

import '../controllers/warp_controller.dart';

class WarpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WarpController>(
      () => WarpController(),
    );
  }
}
