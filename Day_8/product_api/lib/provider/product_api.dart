import 'dart:convert';

import 'package:rest_api_country/model/product.dart';
import 'package:http/http.dart' as http;
class ProductApi {
  Future<List<Product>?> getProducts() async {
    var client = http.Client();
    var uri = Uri.parse('https://fakestoreapi.com/products');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Product> products = data.map((json) => Product.fromJson(json)).toList();
      return products;
    }
    return null;
  }
}