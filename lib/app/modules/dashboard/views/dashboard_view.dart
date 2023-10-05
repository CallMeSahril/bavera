import 'package:bavera/app/modules/game/views/game_view.dart';
import 'package:bavera/app/modules/home/views/home_view.dart';
import 'package:bavera/app/modules/match/views/match_view.dart';
import 'package:bavera/app/modules/pay/views/pay_view.dart';
import 'package:bavera/app/modules/report/views/report_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomeView(),
                GameView(),
                MatchView(),
                PayView(),
                ReportView(),
              ],
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

  Widget _buildBottomNavigationBar(DashboardController controller) {
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
          icon: Icons.home,
          label: 'Home',
          isActive: controller.tabIndex == 0,
        ),
        _bottomNavigationBarItem(
          icon: Icons.play_arrow,
          label: 'Game',
          isActive: controller.tabIndex == 1,
        ),
        _bottomNavigationBarItem(
          icon: Icons.gamepad,
          label: 'Match',
          isActive: controller.tabIndex == 2,
        ),
        _bottomNavigationBarItem(
          icon: Icons.money,
          label: 'Pay',
          isActive: controller.tabIndex == 3,
        ),
        _bottomNavigationBarItem(
          icon: Icons.history,
          label: 'Laporan',
          isActive: controller.tabIndex == 4,
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
