import 'dart:convert';

import 'package:bavera/app/data/entities/user.dart';
import 'package:bavera/app/data/repositories/bavera_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController {
  // //TODO: Implement HomeController

  // final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // void increment() => count.value++;

  List<UserEntity> resultUser =
      [UserEntity(name: "Sahril", id: 1, createdAt: DateTime.now())].obs;
  var isLoading = true.obs;
  TextEditingController nameController = TextEditingController();

  fetchGetListUser() async {
    Supabase.instance.client.from('members').stream(primaryKey: ['id']);
  }

  addMebers(String name) async {
    isLoading.value = true;
    await Supabase.instance.client.from('members').insert({'name': name});
    isLoading.value = false;
  }

  deleteMember(int id) async {
    // Hapus member dari database.
    await Supabase.instance.client
        .from('members')
        .delete()
        .eq('id', id)
        .execute();

    // Perbarui UI untuk mencerminkan perubahan.
    update();
  }
}
