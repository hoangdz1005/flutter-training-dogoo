import 'package:flutter/material.dart';
import 'package:widget_basic_2/models/product.dart';

import '../models/confirm_actions.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({super.key});

  @override
  State<DialogPage> createState() => _FormPageState();
}

class _FormPageState extends State<DialogPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _textFieldController = TextEditingController();
  void _handleClick() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Simple Alert"),
          content: const Text("This is an alert message."),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK')),
          ],
        );
      },
    );
  }
  void _showDialog() {
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Text Field Alert Demo"),
        content: TextField(
          controller: _textFieldController,
          decoration: const InputDecoration(hintText: "TextField in Dialog"),
        ),
        actions: [
          TextButton(onPressed: () {Navigator.of(context).pop();}, child: const Text("SUBMIT"))
        ],
      );
    });
  }

  void _handleConfirmDialog() {
    _asyncConfirmDialog(context);
  }
  Future<ConfirmAction?> _asyncConfirmDialog(BuildContext context) async {
    return showDialog<ConfirmAction>(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete This Contact?'),
          content: const Text(
              'This will delete the contact from your device.'),
          actions: <Widget>[
            TextButton(onPressed: () {Navigator.pop(context, ConfirmAction.Cancel);}, child: const Text("Cancel")),
            TextButton(onPressed: () {Navigator.pop(context, ConfirmAction.Cancel);}, child: const Text("Accept")),
          ],
        );
      },
    );
  }


  void _handleOptionDialog() {
    _asyncSimpleDialog(context);
  }



  Future<Product?> _asyncSimpleDialog(BuildContext context) async {
    return await showDialog<Product>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Select Product '),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Product.Apple);
                },
                child: const Text('Apple'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Product.Samsung);
                },
                child: const Text('Samsung'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Product.Huawei);
                },
                child: const Text('Huawei'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Product.Oppo);
                },
                child: const Text('Oppo'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Product.BKAV);
                },
                child: const Text('BKAV'),
              ),
            ],
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Page"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // AlertDialog(
          //   alignment: Alignment.center,
          //   title: const Text(
          //     "Sample Dialog",
          //     textAlign: TextAlign.center,
          //   ),
          //   backgroundColor: Colors.grey.shade200,
          //   content: const Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [Text("Made by NNH"), Icon(Icons.sports_football)],
          //   ),
          //   actions: const [
          //     TextButton(onPressed: null, child: Text('Yes')),
          //     TextButton(onPressed: null, child: Text('No'))
          //   ],
          // ),
          TextButton(onPressed: _handleClick, child: const Text("Click me!")),
          Container(
            color: Colors.green.shade500,
            child: TextButton(onPressed: _showDialog, child: const Text("Show Alert Dialog!", style: TextStyle(color: Colors.white),)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            color: Colors.green.shade500,
            child: TextButton(onPressed: _handleConfirmDialog, child: const Text("Show Confirm Dialog!", style: TextStyle(color: Colors.white),)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            color: Colors.green.shade500,
            child: TextButton(onPressed: _handleOptionDialog, child: const Text("Show Option Dialog!", style: TextStyle(color: Colors.white),)),
          )
        ],
      )),
    );
  }
}
