import 'package:get/get.dart';

import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/dashboardadmin/bindings/dashboardadmin_binding.dart';
import '../modules/dashboardadmin/views/dashboardadmin_view.dart';
import '../modules/detailreport/bindings/detailreport_binding.dart';
import '../modules/detailreport/views/detailreport_view.dart';
import '../modules/game/bindings/game_binding.dart';
import '../modules/game/views/game_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/logout/bindings/logout_binding.dart';
import '../modules/logout/views/logout_view.dart';
import '../modules/match/bindings/match_binding.dart';
import '../modules/match/views/match_view.dart';
import '../modules/pay/bindings/pay_binding.dart';
import '../modules/pay/views/pay_view.dart';
import '../modules/report/bindings/report_binding.dart';
import '../modules/report/views/report_view.dart';
import '../modules/tabungan/bindings/tabungan_binding.dart';
import '../modules/tabungan/views/tabungan_view.dart';
import '../modules/warp/bindings/warp_binding.dart';
import '../modules/warp/views/warp_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WARP;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.GAME,
      page: () => GameView(),
      binding: GameBinding(),
    ),
    GetPage(
      name: _Paths.PAY,
      page: () => PayView(),
      binding: PayBinding(),
    ),
    GetPage(
      name: _Paths.REPORT,
      page: () => const ReportView(),
      binding: ReportBinding(),
    ),
    GetPage(
      name: _Paths.DETAILREPORT,
      page: () => const DetailreportView(),
      binding: DetailreportBinding(),
    ),
    GetPage(
      name: _Paths.MATCH,
      page: () => MatchView(),
      binding: MatchBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARDADMIN,
      page: () => const DashboardadminView(),
      binding: DashboardadminBinding(),
    ),
    GetPage(
      name: _Paths.WARP,
      page: () => WarpView(),
      binding: WarpBinding(),
    ),
    GetPage(
      name: _Paths.LOGOUT,
      page: () => const LogoutView(),
      binding: LogoutBinding(),
    ),
    GetPage(
      name: _Paths.TABUNGAN,
      page: () => TabunganView(),
      binding: TabunganBinding(),
    ),
  ];
}
