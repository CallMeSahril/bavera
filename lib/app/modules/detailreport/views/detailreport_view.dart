import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detailreport_controller.dart';

class DetailreportView extends GetView<DetailreportController> {
  const DetailreportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailreportView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailreportView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
