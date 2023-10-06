import 'package:bavera/app/widget/search_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pay_controller.dart';

class PayView extends StatelessWidget {
  final PayController controller = Get.put(PayController());

  PayView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.getPaymentList();
        },
        child: Icon(Icons.refresh),
      ),
      appBar: AppBar(
        title: const Text('PayView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SearchTextField(
            hintText: "Cari nama disini",
            onChanged: (value) {
              if (value.isEmpty) {
              } else {
                controller.getPaymentList(name: value);
              }
            },
            widget: Text(""),
          ),
          Obx(
            () => controller.isLoading.value
                ? Expanded(child: Center(child: CircularProgressIndicator()))
                : controller.listPayMent!.length == 0
                    ? Expanded(child: Center(child: Text("Data Kosong")))
                    : Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.all(10),
                          itemCount: controller.listPayMent!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              height: 150,
                              width: 360,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 2)),
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Nama : ${controller.listPayMent![index].name[0]}"),
                                      Text(
                                          "Total Pertandingan : ${controller.listPayMent![index].name.length}"),
                                      Text(
                                          "Total Kok : ${controller.listPayMent![index].kok.reduce((a, b) => a + b)}"),
                                      Text(
                                          "Rp ${controller.listPayMent![index].kok.reduce((a, b) => a + b) * 3000 + controller.listPayMent![index].price}")
                                    ],
                                  ),
                                  Positioned(
                                    right: 10,
                                    top: 10,
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 2)),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
