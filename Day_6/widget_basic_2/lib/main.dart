import 'package:flutter/material.dart';
import 'package:widget_basic_2/screens/dialog.dart';
import 'package:widget_basic_2/screens/form.dart';
import 'package:widget_basic_2/screens/stack.dart';
import 'package:widget_basic_2/screens/tab_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DialogPage(),
    );
  }
}


