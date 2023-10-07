import 'package:bavera/app/core/services/local_db.dart';
import 'package:bavera/app/routes/app_pages.dart';
import 'package:bavera/app/widget/mydialog.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: Obx(() => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Nama",
                        style: TextStyle(fontSize: 20),
                      ),
                      _buildText(controller: controller.nameController),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "NPM",
                        style: TextStyle(fontSize: 20),
                      ),
                      _buildText(controller: controller.pwController),
                      SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            if (controller.nameController.text.isEmpty ||
                                controller.pwController.text.isEmpty) {
                              print("object");
                              showDialog(
                                  context: context,
                                  builder: (context) => MyDialog(
                                        title:
                                            "Nama Dan NPM tidak boleh kosong",
                                        onYes: () {
                                          Get.back();
                                        },
                                        onNo: () {
                                          Get.back();
                                        },
                                        content: Text(""),
                                      ));
                            }

                            await controller.getAdmin(
                                controller.nameController.text.toLowerCase());
                            if (controller.nameController.text.toLowerCase() ==
                                    controller.adminEntity!.username
                                        .toLowerCase() &&
                                controller.pwController.text.toLowerCase() ==
                                    controller.adminEntity!.pw.toLowerCase()) {
                              print(3);
                              LocalDb.loggedIn = true;
                              LocalDb.fcmName =
                                  controller.nameController.text.toLowerCase();
                              Get.offAllNamed(Routes.DASHBOARDADMIN);
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) => MyDialog(
                                        title: "Nama Dan NPM Tidak Terdaftar",
                                        onYes: () {
                                          Get.back();
                                        },
                                        onNo: () {
                                          Get.back();
                                        },
                                        content: Text(""),
                                      ));
                            }
                            controller.onIsloading(false);
                          },
                          child: Text("Masuk"),
                        ),
                      ),
                    ],
                  ),
                ),
              )));
  }

  TextFormField _buildText({TextEditingController? controller}) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      style: const TextStyle(
          color: Color.fromRGBO(45, 45, 45, 1),
          fontFamily: 'DM Sans',
          fontSize: 12,
          letterSpacing:
              0 /*percentages not used in flutter. defaulting to zero*/,
          fontWeight: FontWeight.normal,
          height: 1),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
          borderSide:
              BorderSide(color: Color.fromRGBO(243, 244, 246, 1), width: 1),
        ),
      ),
    );
  }
}
