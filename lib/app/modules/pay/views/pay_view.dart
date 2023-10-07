import 'package:bavera/app/widget/mydialog.dart';
import 'package:bavera/app/widget/search_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/helper.dart';
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              height: 150,
                              width: 360,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 2)),
                              child: Stack(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Nama : ${controller.listPayMent![index].username}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                            "Total Pertandingan : ${controller.listPayMent![index].name.length}"),
                                        Text(
                                            "Total Kok : ${controller.listPayMent![index].kok.reduce((a, b) => a + b)} x Rp 3.000 = ${formatCurrency(controller.listPayMent![index].kok.reduce((a, b) => a + b) * 3000)}"),
                                        Text(
                                            "Lapangan = ${formatCurrency(controller.listPayMent![index].price)}"),
                                        Text(
                                            "Total Pembayaran =  ${formatCurrency(controller.listPayMent![index].kok.reduce((a, b) => a + b) * 3000 + controller.listPayMent![index].price)}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    right: 10,
                                    top: 0,
                                    child: Text(
                                      controller.listPayMent![index].ket
                                          ? "Lunas"
                                          : "Belum Bayar",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Positioned(
                                      right: 10,
                                      top: 10,
                                      child: controller.listPayMent![index].ket
                                          ? Text("")
                                          : IconButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        MyDialog(
                                                          content: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  "Duit Simpenan"),
                                                              TextFormField(
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                controller:
                                                                    controller
                                                                        .priceController,
                                                              ),
                                                            ],
                                                          ),
                                                          title:
                                                              "Apakah Pembayaran Selesai?",
                                                          onYes: () async {
                                                            Get.back();
                                                            await controller
                                                                .onIsLoading(
                                                                    true);
                                                            await controller
                                                                .updatePayment(
                                                              kok: controller
                                                                  .listPayMent![
                                                                      index]
                                                                  .kok,
                                                              isPay: true,
                                                              userName: controller
                                                                  .listPayMent![
                                                                      index]
                                                                  .username,
                                                            );
                                                            if (controller
                                                                .priceController
                                                                .text
                                                                .isNotEmpty) {
                                                              await controller.postTabungan(
                                                                  name: controller
                                                                      .listPayMent![index]
                                                                      .username,
                                                                  duit: [
                                                                    int.parse(controller
                                                                        .priceController
                                                                        .text)
                                                                  ]);
                                                              // add tabungan
                                                            }
                                                            await controller
                                                                .getPaymentList();
                                                            controller
                                                                .priceController
                                                                .clear();
                                                          },
                                                          onNo: () {
                                                            Get.back();
                                                          },
                                                        ));
                                              },
                                              icon: Icon(Icons.payment)))
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
