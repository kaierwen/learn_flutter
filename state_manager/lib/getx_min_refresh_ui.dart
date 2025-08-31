import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 测试最小刷新UI
class MinRefreshUI extends StatelessWidget {
  MinRefreshUI({super.key});

  final MinRefreshController controller = Get.put(MinRefreshController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Min Refresh UI')),
      body: Center(
        child: Column(
          children: [
            Obx(() => Text('${controller.count}')),
            ElevatedButton(
              onPressed: controller.increment,
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}

class MinRefreshController extends GetxController {
  final count = 0.obs;

  void increment() => count.value++;
}
