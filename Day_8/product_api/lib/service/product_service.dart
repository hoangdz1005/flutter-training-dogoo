import 'package:rest_api_country/model/product.dart';
import 'package:rest_api_country/provider/product_api.dart';

class ProductService {
  final _api = ProductApi();
  Future<List<Product>?> getAllProducts() async {
    return _api.getProducts();
  }
}