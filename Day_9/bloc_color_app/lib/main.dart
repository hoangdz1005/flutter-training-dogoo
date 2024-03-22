import 'package:color_app/bloc/color_bloc.dart';
import 'package:color_app/screens/color_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
      BlocProvider(create: (_) => ColorBloc(), child: const ColorScreen()),
    );
  }
}