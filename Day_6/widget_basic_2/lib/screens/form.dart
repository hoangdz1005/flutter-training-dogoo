import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Page"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Enter your name',
                    labelText: 'Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter this field';
                    } else if (value.length < 3) {
                      return 'Name must be at least 3 characters';
                    }
                    return null;
                  }),
              TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.phone),
                    hintText: 'Enter a phone number',
                    labelText: 'Phone',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter this field';
                    }
                    return null;
                  }),
              TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Enter your date of birth',
                    labelText: 'Dob',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter this field';
                    }
                    return null;
                  }),
              Container(
                  margin: const EdgeInsets.only(top: 30, left: 120, right: 120),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ],
          ),
        ),
      )
    );
  }
}
