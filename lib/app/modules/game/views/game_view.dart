import 'package:bavera/app/widget/mydialog.dart';
import 'package:bavera/app/widget/mydropdown.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/game_controller.dart';

class GameView extends StatelessWidget {
  final GameController controller = Get.put(GameController());

  GameView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('GameView'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                _buildTeam(
                    team: "Team 1",
                    controllerSatu: controller.nameSatuController,
                    controllerDua: controller.nameDuaController),
                Text(
                  "VS",
                  style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
                ),
                _buildTeam(
                    team: "Team 2",
                    controllerSatu: controller.nameTigaController,
                    controllerDua: controller.nameEmpatController),
                SizedBox(
                  height: 40,
                ),
                Obx(
                  () => Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Positioned(
                          left: controller.isActiveTukar.value ? 10 : null,
                          right: controller.isActiveTukar.value ? null : 10,
                          child: _buildScore(
                              Team: "Team 1",
                              value: controller.countTeamOne.value,
                              onTapMin: () {
                                controller.decrementOne();
                              },
                              onTapAdd: () {
                                controller.incrementOne();
                              },
                              onTapReset: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => MyDialog(
                                      onYes: () {
                                        controller.resetValueOne();
                                        Get.back();
                                      },
                                      onNo: () {
                                        Get.back();
                                      },
                                      title: "Reset",
                                      content: ""),
                                );
                              }),
                        ),
                        Center(
                          child: IconButton(
                              onPressed: () {
                                if (controller.isActiveTukar.value) {
                                  controller.onTukar(false);
                                } else {
                                  controller.onTukar(true);
                                }
                              },
                              icon: Icon(
                                Icons.refresh_outlined,
                                size: 40,
                              )),
                        ),
                        Positioned(
                          right: controller.isActiveTukar.value ? 10 : null,
                          left: controller.isActiveTukar.value ? null : 10,
                          child: _buildScore(
                              Team: "Team 2",
                              value: controller.countTeamTwo.value,
                              onTapMin: () {
                                controller.decrementTwo();
                              },
                              onTapAdd: () {
                                controller.incrementTwo();
                              },
                              onTapReset: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => MyDialog(
                                      onYes: () {
                                        controller.resetValueTwo();
                                        Get.back();
                                      },
                                      onNo: () {
                                        Get.back();
                                      },
                                      title: "Reset",
                                      content: ""),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _buildKOK(context),
                SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => MyDialog(
                          title: "Game Sudah Selesai?",
                          content:
                              "Jika Selesai Tekan Ya, Jika Belum Tekan Tidak",
                          onYes: () {
                            var lap = 0;
                            print(controller.nameSatuController.text);
                            print(controller.nameDuaController.text);
                            print(controller.nameTigaController.text);
                            print(controller.nameEmpatController.text);
                            print(controller.countTeamOne);
                            print(controller.countTeamTwo);
                            print(controller.countKOK);
                            print(controller.selectedItem.value);
                            if (controller.selectedItem.value == 'Lapangan 1') {
                              lap = 1;
                            } else if (controller.selectedItem.value ==
                                'Lapangan 2') {
                              lap = 2;
                            } else {
                              lap = 3;
                            }

                            controller.addMatch(
                                nameSatu: controller.nameSatuController.text,
                                nameDua: controller.nameDuaController.text,
                                nameTiga: controller.nameTigaController.text,
                                nameEmpat: controller.nameEmpatController.text,
                                skorTeamSatu: controller.countTeamOne.value,
                                skorTeamDua: controller.countTeamTwo.value,
                                kok: controller.countKOK.value,
                                lapangan: lap);
                            Get.back();
                          },
                          onNo: () {
                            Get.back();
                          }),
                    );
                  },
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      "Selesai",
                      style: TextStyle(fontSize: 25),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  _buildKOK(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 120,
          width: 100,
          decoration: BoxDecoration(
              color: Colors.green,
              border: Border.all(color: Colors.black, width: 2)),
          child: Obx(
            () => Column(
              children: [
                Text("KOK"),
                Text(
                  "${controller.countKOK.value}",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.decrementKok();
                      },
                      child: Container(
                        color: Colors.white,
                        width: 30,
                        height: 30,
                        child: Center(
                          child: Text(
                            "-",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => MyDialog(
                              onYes: () {
                                controller.resetValueKok();
                                Get.back();
                              },
                              onNo: () {
                                Get.back();
                              },
                              title: "Reset",
                              content: ""),
                        );
                      },
                      child: Icon(
                        Icons.restore,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.incrementKok();
                      },
                      child: Container(
                        color: Colors.white,
                        width: 30,
                        height: 30,
                        child: Center(
                          child: Text(
                            "+",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 50,
          width: 200,
          child: Container(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Obx(() => MyDropdown(
                  value: controller.selectedItem.value,
                  onChanged: controller.onItemSelected,
                  items: const [
                    'Lapangan 1',
                    'Lapangan 2',
                    'Lapangan 3',
                  ],
                )),
          ),
        ),
      ],
    );
  }

  Container _buildScore({
    required String Team,
    required int value,
    required Function() onTapMin,
    required Function() onTapAdd,
    required Function() onTapReset,
  }) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 199,
      width: 122,
      decoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(color: Colors.black, width: 2)),
      child: Column(
        children: [
          Text(Team),
          Text(
            "$value",
            style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: onTapMin,
                child: Container(
                  color: Colors.white,
                  width: 20,
                  child: Center(
                    child: Text(
                      "-",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ),
              IconButton(onPressed: onTapReset, icon: Icon(Icons.restore)),
              InkWell(
                onTap: onTapAdd,
                child: Container(
                  color: Colors.white,
                  width: 20,
                  child: Center(
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Column _buildTeam({
    required String team,
    required TextEditingController controllerSatu,
    required TextEditingController controllerDua,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(team),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controllerSatu,
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
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(243, 244, 246, 1), width: 1),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: controllerDua,
                style: const TextStyle(
                    color: Color.fromRGBO(45, 45, 45, 1),
                    fontFamily: 'DM Sans',
                    fontSize: 12,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(243, 244, 246, 1), width: 1),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
