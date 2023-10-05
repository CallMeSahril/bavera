import 'package:bavera/app/widget/search_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pay_controller.dart';

class PayView extends GetView<PayController> {
  const PayView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PayView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SearchTextField(
            hintText: "Cari nama disini",
            onChanged: (value) {},
            widget: Text(""),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  height: 150,
                  width: 360,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2)),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nama : Sahril"),
                          Text("Total Pertandingan : 2"),
                          Text("Total Kok : 1"),
                          Text("Rp 15.000")
                        ],
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 2)),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
