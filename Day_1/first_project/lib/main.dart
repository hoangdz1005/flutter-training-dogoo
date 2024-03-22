import 'package:flutter/material.dart';
import 'model/product.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Application',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Product Demo Home Page'),
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
  late String productName;
  late double productPrice;
  int productQuantity = 0;

  void _calculateTotalPrice() {
    Product product = Product(productName, productPrice, productQuantity);
    double totalPrice = product.getTotalPrice();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Tổng số tiền với sản phẩm $productName với giá $productPrice với số lượng $productQuantity là:"),
        content: Text('$totalPrice'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Product Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Nhập thông tin cho sản phẩm',
            ),

            TextField(
              decoration: const InputDecoration(labelText: 'Tên sản phẩm'),
              onChanged: (value) {
                productName = value;
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Giá sản phẩm'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                productPrice = double.tryParse(value) ?? 0;
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Số lượng'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                productQuantity = int.tryParse(value) ?? 0;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateTotalPrice,
              child: const Text('Tổng tiền thanh toán'),
            ),
          ],
        ),
      ),

    );
  }
}
