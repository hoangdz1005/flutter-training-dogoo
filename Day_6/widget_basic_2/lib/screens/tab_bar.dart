import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Center(
          child: Text(
        'It is a contact tab, which is responsible for displaying the contacts stored in your mobile',
        style: TextStyle(fontSize: 32.0),
      )),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Center(
        child: Text(
          'It is a second layout tab, which is responsible for taking pictures from your mobile.',
          style: TextStyle(fontSize: 35.0),
        ),
      ),
    );
  }
}

class TabBarPage extends StatelessWidget {
  const TabBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Tabs Demo'),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.contacts), text: "Tab 1"),
                Tab(icon: Icon(Icons.camera_alt), text: "Tab 2")
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              FirstScreen(),
              SecondScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
