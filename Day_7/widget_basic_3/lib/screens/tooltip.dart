import 'package:flutter/material.dart';

class TooltipPage extends StatelessWidget {
  const TooltipPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tooltip Demo Page"),
        backgroundColor: Colors.blue,
      ),
      body: Tooltip(
        waitDuration: const Duration(seconds: 1),
        showDuration: const Duration(seconds: 2),
        padding: const EdgeInsets.all(5),
        height: 35,
        textStyle: const TextStyle(
            fontSize: 15, color: Colors.white, fontWeight: FontWeight.normal),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.green),
        message: 'User Account',
        child: Container(
          margin: EdgeInsets.all(20),
          width: 50,
          height: 50,
          child: Image.network('https://cdn-icons-png.flaticon.com/512/9131/9131529.png',),
        )
      ),
    );
  }
}
