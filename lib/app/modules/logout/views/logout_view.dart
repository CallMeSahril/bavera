import 'package:bavera/app/core/services/local_db.dart';
import 'package:bavera/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/logout_controller.dart';

class LogoutView extends GetView<LogoutController> {
  const LogoutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LogoutView'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            LocalDb.loggedIn = false;
            Get.offAllNamed(Routes.DASHBOARD);
          },
          icon: Icon(Icons.logout),
          label: Text("Logout"),
        ),
      ),
    );
  }
}
