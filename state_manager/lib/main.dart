import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'getx_min_refresh_ui.dart';

void main() {
  runApp(const MainApp());
  Isolate.run(() => print('Hello, world!'));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.separated(
          itemBuilder:
              (context, index) => GestureDetector(
                onTap: () => Get.to(() => MinRefreshUI()),
                child: ListTile(title: Text('Item $index')),
              ),
          itemCount: 10,
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
    );
  }
}
