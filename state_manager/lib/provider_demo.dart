import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    ChangeNotifier;
    return MaterialApp(
      home: Scaffold(
        body: ListView.separated(
          itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
          itemCount: 10,
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
    );
  }
}
