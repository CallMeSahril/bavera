import 'package:get/get.dart';

class DashboardController extends GetxController {
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;

    update();
  }

  void switchToOrderTab() {
    // Ganti indeks tab ke halaman pesanan (OrderView)
    tabIndex = 1;
    update();
  }
}
