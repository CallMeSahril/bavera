import 'package:bavera/app/widget/search_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../widget/mydropdown.dart';
import '../controllers/match_controller.dart';

class MatchView extends StatelessWidget {
  MatchView({Key? key}) : super(key: key);

  final MatchController controller = Get.put(MatchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.getMatch();
        },
        child: Icon(Icons.refresh),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            SearchTextField(
              hintText: "Cari nama disini",
              // controller: controller.nameController,
              // onTap: () {
              //   controller.getMatch(name: controller.nameController.text);
              // },
              onChanged: (value) {
                if (value.isEmpty) {
                } else {
                  controller.getMatch(name: value);
                }
              },
              widget: Text(""),
            ),
            Container(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Obx(() => MyDropdown(
                    value: controller.selectedItem.value,
                    onChanged: controller.onItemSelected,
                    items: const [
                      'All',
                      'Lapangan 1',
                      'Lapangan 2',
                      'Lapangan 3',
                    ],
                  )),
            ),
            Obx(() => controller.isLoading.value
                ? Expanded(child: Center(child: CircularProgressIndicator()))
                : controller.listMatch!.length == 0
                    ? Expanded(child: Center(child: Text("Data Kosong")))
                    : Expanded(
                        child: ListView.builder(
                          itemCount: controller.listMatch!.length,
                          itemBuilder: (context, index) {
                            final result = controller.listMatch![index];
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              height: 100,
                              decoration:
                                  BoxDecoration(color: Colors.greenAccent),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          Text("Team 1",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                              "${result.nameSatu} dan ${result.nameDua}"),
                                          Text("Score",
                                              style: TextStyle(fontSize: 12)),
                                          Text(
                                            "${result.skorTeamSatu}",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "VS",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text("Kok = ${result.kok}"),
                                          Text(
                                            "Lap= ${result.lapangan}",
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text("Team 2",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                              "${result.nameTiga} dan ${result.nameEmpat}"),
                                          Text("Score",
                                              style: TextStyle(fontSize: 12)),
                                          Text(
                                            "${result.skorTeamDua}",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                            // return ListTile(
                            //   title: Text("${result.nameSatu} "),
                            // );
                          },
                        ),
                      )),
          ],
        ),
      ),
    );
  }
}
