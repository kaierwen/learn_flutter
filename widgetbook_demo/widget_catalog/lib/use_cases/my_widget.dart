import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_demo/main.dart';

// Import the widget from your app

@widgetbook.UseCase(name: 'Default', type: MyWidget)
Widget buildMyWidgetUseCase(BuildContext context) {
  return MyWidget();
}
