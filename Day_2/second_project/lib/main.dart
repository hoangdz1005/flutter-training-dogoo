
import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Food Detail'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      decoration: BoxDecoration(
                          color: const Color(0x77A9C9FF),
                          border: Border.all(
                            color: Colors.black, // Màu viền
                            width: 1.0, // Độ dày của viền
                          )
                      ),
                      child: const Text('Strawberry Pavlova', textAlign: TextAlign.center,style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),),
                    ),

                    Container(
                      // padding: const EdgeInsets.all(10.0),
                      padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                      margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      decoration: BoxDecoration(
                          color: const Color(0x77A9C9FF),
                          border: Border.all(
                            color: Colors.black, // Màu viền
                            width: 1.0, // Độ dày của viền
                          )
                      ),
                      child: const Text('Strawberry Pavlova is a delightful dessert that embodies elegance and indulgence', textAlign: TextAlign.center,style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black,
                      ),),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      decoration: BoxDecoration(
                          color: const Color(0x77A9C9FF),
                          border: Border.all(
                            color: Colors.black, // Màu viền
                            width: 1.0, // Độ dày của viền
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < 5; i++)
                            Padding(
                              padding: const EdgeInsets.only(right: 3.0),
                              child: Image.network(
                                'https://cdn-icons-png.flaticon.com/512/118/118669.png',
                                width: 10,
                                height: 10,
                              ),
                            ),
                          const SizedBox(width: 15.0,),
                          const Text('170 Reviews',style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,

                          ),),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                      decoration: BoxDecoration(
                          color: const Color(0x77A9C9FF),
                          border: Border.all(
                            color: Colors.black, // Màu viền
                            width: 1.0, // Độ dày của viền
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTt-IEzBSuEVPsr451pBy2QPCNLUyevI33Hqw&usqp=CAU', width: 20, height: 20,),
                              const SizedBox(height: 5),
                              const Text(
                                'PREP',
                                style: TextStyle(fontSize: 10.0),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                '25 min',
                                style: TextStyle(fontSize: 10.0),
                              ),
                            ],
                          ),
                          const SizedBox(width: 21.0,),
                          Column(
                            children: [
                              Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTt-IEzBSuEVPsr451pBy2QPCNLUyevI33Hqw&usqp=CAU', width: 20, height: 20,),
                              const SizedBox(height: 5),
                              const Text(
                                'COOK',
                                style: TextStyle(fontSize: 10.0),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                '1 hr',
                                style: TextStyle(fontSize: 10.0),
                              ),
                            ],
                          ),
                          const SizedBox(width: 21.0,),
                          Column(
                            children: [
                              Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTt-IEzBSuEVPsr451pBy2QPCNLUyevI33Hqw&usqp=CAU', width: 20, height: 20,),
                              const SizedBox(height: 5),
                              const Text(
                                'FEEDS',
                                style: TextStyle(fontSize: 10.0),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                '4-6',
                                style: TextStyle(fontSize: 10.0),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black, // Màu viền
                      width: 2.0, // Độ dày của viền
                    ),
                  ),
                child: Image.network(
                  'https://hips.hearstapps.com/hmg-prod/images/strawberrypavlova-recipe-1-1648495602.jpg',
                  height: 250,
                  fit: BoxFit.cover,
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
