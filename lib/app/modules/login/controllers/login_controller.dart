import 'package:bavera/app/data/entities/admin_entities.dart';
import 'package:bavera/app/data/repositories/bavera_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  TextEditingController nameController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  AdminEntity? adminEntity;
  var isLoading = false.obs;
  onIsloading(bool isLoad) {
    isLoading.value = isLoad;
  }

  getAdmin(String name) async {
    isLoading.value = true;

    final baveraRepo = BaveraRepository();

    var adminFuture = baveraRepo.findByUserNameAdmin(name);

    if (adminFuture != null) {
      adminEntity = await adminFuture;
    }

    if (adminEntity != null) {
      // Admin ditemukan
      print(adminEntity!.username);
    } else {
      // Admin tidak ditemukan
      print("Admin tidak ditemukan");
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
