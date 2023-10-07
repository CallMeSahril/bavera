import 'package:bavera/app/core/services/local_db.dart';
import 'package:bavera/app/modules/home/views/home_view.dart';
import 'package:bavera/app/modules/logout/views/logout_view.dart';
import 'package:bavera/app/modules/pay/views/pay_view.dart';
import 'package:bavera/app/modules/report/views/report_view.dart';
import 'package:bavera/app/modules/tabungan/views/tabungan_view.dart';
import 'package:bavera/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboardadmin_controller.dart';

class DashboardadminView extends GetView<DashboardadminController> {
  const DashboardadminView({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return GetBuilder<DashboardadminController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [PayView(), ReportView(), TabunganView(), LogoutView()],
            ),
          ),
          // bottomNavigationBar: _buildBottomNavigationBar(controller),
          // bottomNavigationBar: controller.tabIndex == 2
          //     ? null // Hide the BottomNavigationBar for the "Post" page
          //     : _buildBottomNavigationBar(controller),
          //               // bottomNavigationBar: _buildBottomNavigationBar(controller),
          bottomNavigationBar: _buildBottomNavigationBar(controller),
        );
      },
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('DashboardadminView'),
  //       centerTitle: true,
  //     ),

  // }
  Widget _buildBottomNavigationBar(DashboardadminController controller) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.black26,
      selectedItemColor: const Color(0xff5CE1E6),
      onTap: controller.changeTabIndex,
      currentIndex: controller.tabIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      elevation: 0,
      items: [
        _bottomNavigationBarItem(
          icon: Icons.payment,
          label: 'Payment',
          isActive: controller.tabIndex == 4,
        ),
        _bottomNavigationBarItem(
          icon: Icons.history,
          label: 'Laporan',
          isActive: controller.tabIndex == 0,
        ),
        _bottomNavigationBarItem(
          icon: Icons.money,
          label: 'Tabungan',
          isActive: controller.tabIndex == 0,
        ),
        _bottomNavigationBarItem(
          icon: Icons.logout,
          label: 'Logout',
          isActive: controller.tabIndex == 3,
        ),
      ],
    );
  }

  _bottomNavigationBarItem(
      {required IconData icon, required String label, bool isActive = false}) {
    return BottomNavigationBarItem(
      icon: Container(height: 24, width: 24, child: Icon(icon)),
      label: label,
    );
  }
}
