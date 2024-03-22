import 'package:flutter/material.dart';

class StackPage extends StatelessWidget {
  const StackPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn Stack In Flutter"),
      ),
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            color: Colors.green.shade300,
          ),
          Container(
            color: Colors.blue,
            width: 300,
            height: 300,
          ),

          // Sử dụng stack trong stack
          Positioned(
              top: 70,
              left: 0,
              child: Container(
                color: Colors.yellow,
                width: 100,
                height: 100,
                child: const Stack(
                  children: [
                    Positioned(child: Text("Text inside box yellow!"))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
