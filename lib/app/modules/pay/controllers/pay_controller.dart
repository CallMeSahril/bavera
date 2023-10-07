import 'package:bavera/app/data/entities/match_entities.dart';
import 'package:bavera/app/data/repositories/bavera_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/entities/pay_entities.dart';

class PayController extends GetxController {
  // List<MatchEntity>? listMatch;
  List<PayEntity>? listPayMent;
  RxBool isLoading = false.obs;
  RxBool checkBox = false.obs;
  TextEditingController priceController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // getMatch('Sahril');
    getPaymentList();
  }

  onIsLoading(bool isLoad) {
    isLoading.value = isLoad;
  }

  Future getPaymentList({String? name}) async {
    isLoading.value = true;

    final baveraRepo = BaveraRepository();
    var listPayMentResult = await baveraRepo.paymentListAll();
    print(listPayMentResult.length);
    if (name != null) {
      listPayMent = listPayMentResult
          .where((element) => element.username == name)
          .toList();
      print("length payment ${listPayMent!.length}");
    } else {
      listPayMent = listPayMentResult;
      print("length payment ${listPayMent!.length}");
    }
    isLoading.value = false;
  }

  updatePayment({
    required String userName,
    required bool isPay,
    required List<int> kok,
  }) async {
    final baveraRepo = BaveraRepository();
    bool updatePay = await baveraRepo.updatePayment(
      userName: userName,
      isPay: isPay,
      kok: kok,
    );
  }

  postTabungan({
    required String name,
    required List<int> duit,
  }) async {
    final baveraRepo = BaveraRepository();
    bool updatePay = await baveraRepo.postTabungan(duit: duit, nama: name);
  }

  // Future getMatch(String name) async {
  //   isLoading.value = true;

  //   final baveraRepo = BaveraRepository();
  //   var listMatchResult = await baveraRepo.matchListAll();
  //   listMatch = listMatchResult;

  //   print(listMatch!.length);
  //   isLoading.value = false;
  // }

  void namaTidakBolehDoble(List<MatchEntity> listMatch) {
    // Buat list untuk menyimpan nama yang unik

    for (var element in listMatch) {}
  }
}
