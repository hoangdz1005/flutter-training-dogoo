import 'dart:async';
import 'package:flutter/material.dart';

class SlidePage extends StatefulWidget {
  const SlidePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return SlidePageState();
  }
}

class SlidePageState extends State<SlidePage> {
  late int _value;

  @override
  void initState() {
    super.initState();
    _value = 6;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Linear Progress Bar"),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.volume_up),
            Slider(
              min: 1.0,
              max: 20.0,
              divisions: 15,
              activeColor: Colors.blue,
              inactiveColor: Colors.grey,
              label: 'Set volume value',
              value: _value.toDouble(),
              onChanged: (double value) {
                setState(() {
                  _value = value.round();
                });
              },
            )
          ],
        ));
  }
  // this function updates the progress value
}
