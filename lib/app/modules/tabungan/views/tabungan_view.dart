import 'package:bavera/app/widget/search_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tabungan_controller.dart';

class TabunganView extends StatelessWidget {
  TabunganView({Key? key}) : super(key: key);
  final TabunganController controller = Get.put(TabunganController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.getTabunganList();
        },
        child: Icon(Icons.refresh),
      ),
      appBar: AppBar(
        title: const Text('TabunganView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SearchTextField(
            hintText: "Cari nama disini",
            onChanged: (value) {
              if (value.isEmpty) {
              } else {}
            },
            widget: Text(""),
          ),
          Obx(
            () => controller.isLoading.value
                ? Expanded(child: Center(child: CircularProgressIndicator()))
                : controller.listTabungan!.length == 0
                    ? Expanded(child: Center(child: Text("Data Kosong")))
                    : Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.all(10),
                          itemCount: controller.listTabungan!.length,
                          itemBuilder: (context, index) {
                            final result = controller.listTabungan![index];
                            return ListTile(
                              title: Text(result.username),
                              subtitle: Text(
                                  "${result.duit.reduce((a, b) => a + b)}"),
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
