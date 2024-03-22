import 'package:flutter/material.dart';

import '../models/choice.dart';

class ListViewBuilderPage extends StatelessWidget {
  const ListViewBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> products =
        List<String>.generate(500, (i) => "Product List: $i");
    return Scaffold(
        appBar: AppBar(
          title: const Text("List View Builder Demo Page"),
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(products[index]),
            );
          },
        ));
  }
}
