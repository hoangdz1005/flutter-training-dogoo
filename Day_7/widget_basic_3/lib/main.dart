import 'package:flutter/material.dart';
import 'package:widget_basic_3/screens/circular_pogress_indicator.dart';
import 'package:widget_basic_3/screens/grid_view.dart';
import 'package:widget_basic_3/screens/image_slide.dart';
import 'package:widget_basic_3/screens/linear_progress_indicator.dart';
import 'package:widget_basic_3/screens/list_view.dart';
import 'package:widget_basic_3/screens/list_view_builder.dart';
import 'package:widget_basic_3/screens/slide.dart';
import 'package:widget_basic_3/screens/tooltip.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ImageSlidePage(),
    );
  }
}

