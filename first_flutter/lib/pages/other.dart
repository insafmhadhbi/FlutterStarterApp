import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:first_flutter/controllers/counter_controller.dart';

class Other extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterController controller = Get.find(); // Access the globally available controller

    return Scaffold(
      appBar: AppBar(
        title: Text('Other Page'),
      ),
      body: Center(
        child: Obx(() => Text(
              'Current Count: ${controller.count}',
              style: TextStyle(fontSize: 24),
            )),
      ),
    );
  }
}
