import 'package:bavera/app/core/services/local_db.dart';
import 'package:bavera/app/modules/dashboard/views/dashboard_view.dart';
import 'package:bavera/app/modules/dashboardadmin/views/dashboardadmin_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/warp_controller.dart';

class WarpView extends GetView<WarpController> {
  WarpView({Key? key}) : super(key: key);
  WarpController warpController = Get.put(WarpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Image.asset("assets/images/bavera.png")));
  }
}
