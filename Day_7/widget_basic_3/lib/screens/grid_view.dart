
import 'package:flutter/material.dart';

import '../models/choice.dart';

class GridViewPage extends StatelessWidget {

  const GridViewPage({super.key});

  @override
  Widget build(BuildContext context) {
   const List<Choice> choices = <Choice>[
      Choice(title: 'Home', icon: Icons.home),
      Choice(title: 'Contact', icon: Icons.contacts),
      Choice(title: 'Map', icon: Icons.map),
      Choice(title: 'Phone', icon: Icons.phone),
      Choice(title: 'Camera', icon: Icons.camera_alt),
      Choice(title: 'Setting', icon: Icons.settings),
      Choice(title: 'Album', icon: Icons.photo_album),
      Choice(title: 'WiFi', icon: Icons.wifi),
      Choice(title: 'GPS', icon: Icons.gps_fixed),
    ];
    final List<String> products = List<String>.generate(500, (i) => "Product List: $i");
    return Scaffold(
        appBar: AppBar(
          title: const Text("Grid View Demo Page"),
          backgroundColor: Colors.blue,
        ),
        body: GridView.count(
          crossAxisCount: 3,
          children:
            List.generate(choices.length, (index) {
              return Center(
                child: SelectCard(choice: choices[index], key: null,),
              );
            }),
        )
    );
  }
}

class SelectCard extends StatelessWidget {
  const SelectCard({super.key, required this.choice});
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.lightGreenAccent,
        child: Center(child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(child: Icon(choice.icon, size:50.0, color: Colors.blue)),
              Text(choice.title, style:const TextStyle(color: Colors.blue)),
            ]
        ),
        )
    );
  }
}
