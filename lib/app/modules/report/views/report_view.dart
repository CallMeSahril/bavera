import 'package:bavera/app/routes/app_pages.dart';
import 'package:bavera/app/widget/search_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/report_controller.dart';

class ReportView extends GetView<ReportController> {
  const ReportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ReportView'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SearchTextField(
              hintText: "Cari Tanggal disini",
              onChanged: (value) {},
              widget: Text(""),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(Routes.DETAILREPORT);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      height: 150,
                      width: 360,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Tanggal : 10 Oktober 2023"),
                          Text("Uang Masuk : Rp 2.000.000"),
                          Text("Total Hadir : 50 Orang"),
                          Text("Total Kok : 20 KOk")
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
